unless Rails.env.test?
  require 'will_paginate/view_helpers'

  module WillPaginate
    module ActionView
      def will_paginate(collection = nil, options = {})
        options[:renderer] ||= BootstrapLinkRenderer
        super.try :html_safe
      end

      class BootstrapLinkRenderer < LinkRenderer
        protected
          def html_container(html)
            pagination_links = tag(:div, tag(:ul, html, container_attributes))
            tag(:div, pagination_links.concat(pagination_toolbar))
          end

          def pagination_toolbar
            tag(:div, tag(:spam, ApplicationController.helpers.page_entries_info(@collection), class: 'pagination__desc'))
          end

          def page_number(page)
            tag(:li, link(page, page, rel: rel_value(page), class: 'page-link'), class: 'page-item' + (page == current_page ? ' active' : ''))
          end

          def previous_or_next_page(page, text, classname)
            tag(:li, link(text, page || '#', class: 'page-link'), class: ['page-item', classname[0..3], classname, ('disabled' unless page)].join(' '))
          end

          def gap
            tag(:li, link(super, '#', class: 'page-link'), class: 'page-item disabled')
          end
      end
    end
  end
end