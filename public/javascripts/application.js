// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
if (typeof(console) == "undefined" || typeof(console.log) == "undefined") {
  console = {log: function() {}};
}

if(typeof String.prototype.trim !== 'function') {
  String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, ''); 
  }
}

$(document).ready(function() {
    /*
     * QTips
     */
    //$('[title]').each(function(i, a) {
      //if ($(a).attr('title').trim() == '') return
      //$(a).qtip({ style: { name: 'cream', tip: true },
       //position: {
          //corner: {
             //target: 'topMiddle',
             //tooltip: 'bottomMiddle'
          //}
       //}
      //});
   //});
  // $('.datepicker').datepicker($.datepicker.regional['it'], { dateFormat: 'dd-mm-yy', firstDay: 1});
  $('a[rel*=facebox]').facebox();
  if ($('#facebox_show').html().replace(/(<([^>]+)>)/ig,"").trim() != "") {
    jQuery.facebox($('#facebox_show').html());
  }
});

function initFlashMessages2() {
    if($('#flash').html().trim() == "") {
        return;
    }
    $('#box').bounceBox();
    $('#box').bounceBoxToggle();

    $('#box').click(function(){
        $('#box').bounceBoxHide();
    });
}

function initErrorMessages2() {

    var errM = $('#error_explanation').detach();
    $('#flash').append(errM);
    $('#error_explanation').show();
}



/*
 * Nested form function to remove fields
 */
function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

/*
 * Nested form function to add fields
 */
function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().before(content.replace(regexp, new_id));
    //$(link).parents('fieldset').append(content.replace(regexp, new_id));
}


function initFlashMessages() {
    if($('#flash').html().trim() == '')
        return;

    var content = $('#flash').html();
    $('#flash').empty();

   $('#flash').qtip(
   {
      content: {
         title: {
            text: 'System message',
            button: 'Close'
         },
         text: content
      },
      position: {
         target: $(document.body), // Position it via the document body...
         corner: 'topMiddle', // ...at the center of the viewport
         adjust: {
            y: 20
         }
      },
      ready: true,
      show: {
          ready: true,
         when: 'click', // Show it on click
         solo: true // And hide all other tooltips
      },
      hide: false,
      style: {
         width: { max: 650, min: 650 },
         padding: '14px',
         border: {
            width: 9,
            radius: 9,
            color: '#666666'
         },
         name: 'light'
      },
      api: {
         beforeShow: function()
         {
            // Fade in the modal "blanket" using the defined show speed
            $('#qtip-blanket').fadeIn(this.options.show.effect.length);
         },
         beforeHide: function()
         {
            // Fade out the modal "blanket" using the defined hide speed
            $('#qtip-blanket').fadeOut(this.options.hide.effect.length);
         },

         onShow: function() {
             setTimeout(function() {
                 //$('#flash').qtip('destroy');
             }, 3000)
         }
      }
   });

   // Create the modal backdrop on document load so all modal tooltips can use it
   $('<div id="qtip-blanket">')
      .css({
         position: 'absolute',
         top: $(document).scrollTop(), // Use document scrollTop so it's on-screen even if the window is scrolled
         left: 0,
         height: $(document).height(), // Span the full document height...
         width: '100%', // ...and full width

         opacity: 0.7, // Make it slightly transparent
         backgroundColor: 'black',
         zIndex: 5000  // Make sure the zIndex is below 6000 to keep it below tooltips!
      })
      .appendTo(document.body) // Append to the document body
      .hide(); // Hide it initially

}

/*
*  Error should be:
*  {"title": "title for box",
*   "content": "content of the box"
*  }

*/

function showErrorMessagesFromJSON(error) {
//   if($('#messageFromJSON').length == 0) {
//    $('body').append($('<div id="#messageFromJSON" />'));
//   }

   $('#messageFromJSON').qtip(
   {
      content: {
         title: {
            text: error.title,
            button: 'Close'
         },
         text: error.content
      },
      position: {
         target: $(document.body), // Position it via the document body...
         corner: 'center' // ...at the center of the viewport
      },
      ready: true,
      show: {
          ready: true,
         when: 'click', // Show it on click
         solo: true // And hide all other tooltips
      },
      hide: false,
      style: {
         width: { max: 550 },
         padding: '14px',
         border: {
            width: 9,
            radius: 9,
            color: '#666666'
         },
         name: 'light'
      },
      api: {
         beforeShow: function()
         {
            // Fade in the modal "blanket" using the defined show speed
            $('#qtip-blanket').fadeIn(this.options.show.effect.length);
         },
         beforeHide: function()
         {
            // Fade out the modal "blanket" using the defined hide speed
            $('#qtip-blanket').fadeOut(this.options.hide.effect.length);
         }
      }
   });

   // Create the modal backdrop on document load so all modal tooltips can use it
   $('<div id="qtip-blanket">')
      .css({
         position: 'absolute',
         top: $(document).scrollTop(), // Use document scrollTop so it's on-screen even if the window is scrolled
         left: 0,
         height: $(document).height(), // Span the full document height...
         width: '100%', // ...and full width

         opacity: 0.7, // Make it slightly transparent
         backgroundColor: 'black',
         zIndex: 5000  // Make sure the zIndex is below 6000 to keep it below tooltips!
      })
      .appendTo(document.body) // Append to the document body
      .hide(); // Hide it initially


}

function initErrorMessages() {
// $('#error_explanation').wrap('<div id="box2"></div>')
 return;

   $('#error_explanation').qtip(
   {
      content: {
         title: {
            text: 'Validation error',
            button: 'Close'
         },
         text: $('#error_explanation').html()
      },
      position: {
         target: $(document.body), // Position it via the document body...
         corner: 'center' // ...at the center of the viewport
      },
      ready: true,
      show: {
          ready: true,
         when: 'click', // Show it on click
         solo: true // And hide all other tooltips
      },
      hide: false,
      style: {
         width: { max: 550 },
         padding: '14px',
         border: {
            width: 9,
            radius: 9,
            color: '#666666'
         },
         name: 'light'
      },
      api: {
         beforeShow: function()
         {
            // Fade in the modal "blanket" using the defined show speed
            $('#qtip-blanket').fadeIn(this.options.show.effect.length);
         },
         beforeHide: function()
         {
            // Fade out the modal "blanket" using the defined hide speed
            $('#qtip-blanket').fadeOut(this.options.hide.effect.length);
         }
      }
   });

   // Create the modal backdrop on document load so all modal tooltips can use it
   $('<div id="qtip-blanket">')
      .css({
         position: 'absolute',
         top: $(document).scrollTop(), // Use document scrollTop so it's on-screen even if the window is scrolled
         left: 0,
         height: $(document).height(), // Span the full document height...
         width: '100%', // ...and full width

         opacity: 0.7, // Make it slightly transparent
         backgroundColor: 'black',
         zIndex: 5000  // Make sure the zIndex is below 6000 to keep it below tooltips!
      })
      .appendTo(document.body) // Append to the document body
      .hide(); // Hide it initially

}




function initForms() {
  $('<span class="required">*</span>').insertAfter($('label.required'));
  $('fieldset').each(function(i, e) {
    if($(e).find('label.required').length > 0) {
      d = $('<div class="required-fields-note">Fields marked with <span class="required">*</span> are mandatories.</div>.');
      $(e).append(d);
    }
  })
}

function add_token_input_fields(link, association, content, new_value) {
    var new_id = new Date().getTime();

    var regexp = new RegExp("new_" + association, "g");
    //$(link).parent().before(content.replace(regexp, new_id));
    content = content.replace(regexp, new_id);
    input_id = $(content).find('input.tag_id');
    input_destroy = $(content).find('input.destroy');
    $(input_id).val(new_value);
    $(link).append(input_id).append(input_destroy);
    return input_destroy;
}

