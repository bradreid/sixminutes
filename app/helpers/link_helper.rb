module LinkHelper
  def delete_link(*args)
    path         = args.first || {}
    html_options = {
                    :method   => :delete,
                    :confirm  => "Are you sure? Clicking 'OK' will remove this record permanently!",
                    :title    => "Delete",
                    :alt_text => "Delete"
                    }

    html_options.merge!(args.second) if args.second
    name   = html_options.delete(:name) || "Delete"
    img_tg = image_tag('delete.png', :alt => html_options[:alt_text], :title => html_options[:title])
    remote = html_options.delete(:remote)
    bttn   = html_options.delete(:button)
    if remote && bttn
      submit_to_remote(html_options[:alt_text], html_options[:alt_text], html_options.merge({:url => path}))
    elsif remote
      link_to_remote(img_tg, html_options.merge({:url => path, :loading => "$(this).parent().spin();"}))
    else
      link_to(img_tg, path, html_options)
    end
  end  
end