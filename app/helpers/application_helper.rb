module ApplicationHelper

  def title(page_title)
    return content_for(:title) { "#{page_title.to_s} : Passkeep" } if @company
    content_for(:title) { "#{page_title.to_s} : Passkeep" }
  end

  def on_class path
    ' class=active' if request.fullpath.starts_with? path
  end

  def clippy(text, id, bgcolor='#F5F5F5')
    html = <<-EOF
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="110" 
        height="14" id="clippy-#{id}" >
      <param name="movie" value="/swfs/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="text=#{text}">
      <param name="bgcolor" value="#{bgcolor}">
      <embed src="/swfs/clippy.swf"
             width="110"
             height="14"
             name="clippy-#{id}"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="text=#{text}"
             bgcolor="#{bgcolor}"
      />
      </object>
    EOF
    html.html_safe
  end
end
