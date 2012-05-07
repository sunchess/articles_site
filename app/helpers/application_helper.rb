module ApplicationHelper
  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end

  def set_editor
    content_for(:editor) do
      '
      <link rel="stylesheet" type="text/css" href="/markitup/skins/markitup/style.css" />
      <link rel="stylesheet" type="text/css" href="/markitup/sets/default/style.css" />
      <script type="text/javascript" src="/markitup/jquery.markitup.js"></script>
      <script type="text/javascript" src="/markitup/sets/default/set.js"></script>

      <script language="javascript">
      $(document).ready(function()	{
          $(\'#textile\').markItUp(myTextileSettings);
      });
      </script>
      '.html_safe
    end
  end

  def set_editor_comment
    content_for(:editor) do
      ' <link rel="stylesheet" type="text/css" href="/markitup/skins/markitup/style.css" />
        <link rel="stylesheet" type="text/css" href="/markitup/sets/default/style_lite.css" />
        <script type="text/javascript" src="/markitup/jquery.markitup.js"></script>
        <script type="text/javascript" src="/markitup/sets/default/set_lite.js"></script>

        <script language="javascript">
          $(document).ready(function()	{
            jQuery(".markItUp").markItUp(myTextileSettings).css(\'height\', function() {
              /* Since line-height is set in the markItUp-css, fetch that value and
              split it into value and unit.  */
              var h = jQuery(this).css(\'line-height\').match(/(\d+)(.*)/)
              /* Multiply line-height-value with nr-of-rows and add the unit.  */
              return (h[1]*jQuery(this).attr(\'rows\'))+h[2]
            });

          });

        </script>
        '.html_safe
    end
  end


  def sort_image(num)
    if num
      image_tag("/images/m#{num}.png")
    else
      ""
    end
  end


  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) {  page_description }
  end

end


