module ApplicationHelper

  def controller_is?(controller)
    params[:controller].to_s == controller.to_s
  end


  def add_fields_content(f, association, new_object_attributes = {})
    new_object = f.object.class.reflect_on_association(association).klass.new new_object_attributes
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    raw escape_javascript(fields)
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association, attributes = {})
    new_object = f.object.class.reflect_on_association(association).klass.new attributes
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, raw("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end


  def class_for_label(object, attribute)
    "required" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end

  def glink(text, icon)
    content_tag(:span, "",:class=>"#{icon} icon") + text
  end
  
  def box_header(options)
    all_link = options[:all_path].nil? ? "" : link_to(image_tag("icons/all.png"), options[:all_path], :class=>"all")
    return raw("<div class='left'><h2>#{options[:title]}</h2></div><div class='right'>#{all_link}</div><div class='clear'></div>")
  end

end
