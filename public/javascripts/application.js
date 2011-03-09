// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({ 'beforeSend': function(xhr)
{xhr.setRequestHeader("Accept", "text/javascript")} });

$(document).ready(function(){
	$( "#tabs" ).tabs({
		ajaxOptions: {
			error: function( xhr, status, index, anchor ) {
				$( anchor.hash ).html(
					"Couldn't load this tab. We'll try to fix this as soon as possible. ");
			}
		}
	});
});
