  //   <nav id="application-nav-bar">

      // <% if logged_in? && current_page?(users_path) %>
      //   <p>Logged in as <em><%= current_user.name.capitalize %></em></p>
      //   <%= link_to "My Profile", current_user %></ br>
      //   <%= link_to "Logout", :logout, method: :post %></ br>
      // <% end %>

  //     <% if logged_in? && current_page?(users_path) == false %>
  //       <%= link_to "Logout", :logout, method: :post %></ br>
  //       <%= link_to "Home", users_path %>
  //     <% end %>

  //     <% if !logged_in? && current_page?(new_user_path) == false %>
  //       <%= link_to "Become a Tutor", new_user_path(tutor: true) %>
  //       <%= link_to "Become a Student", new_user_path %>
  //     <% end %>

  //     <% if !logged_in? && current_page?(:login) == false %>
  //        <%= link_to "Login", :login %>
  //     <% end %>
  //   </nav>

  // <% if flash[:notice] %>
  //   <p id="notice"><%= flash[:notice] %></p>
  // <% end %>
  // <% if flash[:alert] %>
  //   <p id="alert"><%= flash[:alert] %></p>
  // <% end %>

  // from user_sessions new.html.erb
  // <h1>Login</h1>
  // <%= link_to 'Back', users_path %>