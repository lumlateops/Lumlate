$(".deals_list").html("<%= escape_javascript(render(:partial => 'form', :collection => @deal_emails, :as => :deal_email)) %>");

