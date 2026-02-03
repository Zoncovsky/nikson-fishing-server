# Fix for ActionView::SyntaxErrorInTemplate

**Issue ID:** 8636
**Generated:** 2026-02-03 19:24 UTC
**Status:** 📋 Suggestion only (manual review required)

## Suggested Code Fix

```ruby
erb
<% group.each do |product| %>
```

## Full Analysis

## 🐛 Bug Fix: ActionView::SyntaxErrorInTemplate

**Issue ID:** #8636
**Controller:** `Main::DashboardsController#index`
**Occurrences:** 3 times
**First seen:** 2026-02-03 19:22
**Last seen:** 2026-02-03 19:23

## 🔍 Root Cause Analysis

Missing `do` keyword in the ERB loop on line 19. The syntax `<% group.each |product| %>` is invalid - it should be `<% group.each do |product| %>`.

## 🔧 Suggested Fix

**Before:**
```erb
<% group.each |product| %>
```

**After:**
```erb
<% group.each do |product| %>
```

Additionally, there's extraneous text "йй" after the translation call on line 8 that should be removed:

**Before:**
```erb
<%= I18n.t('main_page.new_products') %>йй
```

**After:**
```erb
<%= I18n.t('main_page.new_products') %>
```

## 📋 Error Details

**Error Message:**
```
Encountered a syntax error while rendering template: check <div class="position-relative overflow-hidden p-3 p-md-5 text-center border-bottom-dark" style="background-image: url('<%= asset_path('banner.jpg') %>'); background-size: cover;">
  <div class="col-md-6 p-lg-5 mx-auto my-5 bg-light text-dark bg-opacity-50 border rounded-3">
    <h1 class="display-3 fw-bold"><%= t('main_page.welcome') %></h1>
    <h3 class="fw-normal mb-3"><%= t('main_page.title') %></h3>
    <div class="d-flex gap-3 justify-content-center lead fw-normal mb-2">
      <% if user_signed_in? %>
        <%= link_to t('main_page.button_catalog'), catalog_path, class: 'btn btn-primary' %>
      <% end %>
    </div>
  </div>
  <div class="product-device shadow-sm d-none d-md-block"></div>
  <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
</div>

<% if @new_arrivals.any? %>
  <div class="container position-relative">
    <div class="album py-2 bg-body-tertiary bg-primary text-dark bg-opacity-75">
      <h2 class="mb-8 text-4xl font-extrabold tracking-tight leading-none text-dark md:text-4xl lg:text-4xl text-center bg-light border border-secondary">
        <%= I18n.t('main_page.new_products') %>йй
      </h2>
      <div class="container">
        <div id="newArrivalsCarousel" class="carousel slide" data-bs-ride="false">
          <div class="carousel-inner">
            <% @new_arrivals.in_groups_of(5, false).each_with_index do |group, index| %>
              <div class="carousel-item <%= 'active' if index.zero? %>">
                <div class="row row-cols-1 row-cols-md-5 g-3">
                  <% group.each |product| %>
                    <div class="col" data-controller="products" data-products-product-value="<%= product.to_json %>">
                      <div class="card shadow-sm h-100">
                        <%= image_tag product.images.first, class: 'bd-placeholder-img card-img-top img-fluid', style: 'height: 201px; object-fit: cover;' %>
                        <div class="card-body d-flex flex-column">
                          <p class="card-text"><%= product.name %></p>
                          <p class="card-text"><%= product.price %> <%= I18n.t('main_page.currency') %></p>
                          <div class="d-flex justify-content-between align-items-center mt-auto">
                            <div class="btn-group">
                              <%= link_to t('main_page.view_details'), main_product_path(product), class: 'btn btn-sm btn-outline-primary' %>
                            </div>
                            <% if user_signed_in? %>
                              <button data-action="click->products#addToCart" class="btn btn-outline-primary btn-sm"><i class="bi bi-cart"></i></button>
                            <% end %>
                          </div>
                        </div>
                      </div>
                    </div>
                  <% end %>
                </div>
              </div>
            <% end %>
          </div>
        </div>
        <button class="carousel-control-prev position-absolute top-50 start-0 translate-middle-y border border-primary" type="button" data-bs-target="#newArrivalsCarousel" data-bs-slide="prev" style="width: 50px; height: 50px; background-color: rgba(0,0,0,0.5); border-radius: 50%;">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next position-absolute top-50 end-0 translate-middle-y border border-primary" type="button" data-bs-target="#newArrivalsCarousel" data-bs-slide="next" style="width: 50px; height: 50px; background-color: rgba(0,0,0,0.5); border-radius: 50%;">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
      </div>
    </div>
  </div>
<% end %>

<div class="container position-relative">
  <div class="album py-2 bg-body-tertiary bg-primary text-dark bg-opacity-75">
    <h2 class="mb-8 text-4xl font-extrabold tracking-tight leading-none text-dark md:text-4xl lg:text-4xl text-center bg-light border border-secondary">
      <%= I18n.t('main_page.popular_item') %>
    </h2>
    <div class="container">
      <div id="popularProductsCarousel" class="carousel slide" data-bs-ride="false">
        <div class="carousel-inner">
          <% @popular_products.in_groups_of(5, false).each_with_index do |group, index| %>
            <div class="carousel-item <%= 'active' if index.zero? %>">
              <div class="row row-cols-1 row-cols-md-5 g-3">
                <% group.each do |product| %>
                  <div class="col" data-controller="products" data-products-product-value="<%= product.to_json %>">
                    <div class="card shadow-sm h-100">
                      <%= image_tag product.images.first, class: 'bd-placeholder-img card-img-top img-fluid', style: 'height: 200px; object-fit: cover;' %>
                      <div class="card-body d-flex flex-column">
                        <p class="card-text"><%= product.name %></p>
                        <p class="card-text"><%= product.price %> <%= I18n.t('main_page.currency') %></p>
                        <div class="d-flex justify-content-between align-items-center mt-auto">
                          <div class="btn-group">
                            <%= link_to t('main_page.view_details'), main_product_path(product), class: 'btn btn-sm btn-outline-primary' %>
                          </div>
                          <% if user_signed_in? %>
                            <button data-action="click->products#addToCart" class="btn btn-outline-primary btn-sm"><i class="bi bi-cart"></i></button>
                          <% end %>
                        </div>
                      </div>
                    </div>
                  </div>
                <% end %>
              </div>
            </div>
          <% end %>
        </div>
      </div>
      <button class="carousel-control-prev position-absolute top-50 start-0 translate-middle-y border border-primary" type="button" data-bs-target="#popularProductsCarousel" data-bs-slide="prev" style="width: 50px; height: 50px; background-color: rgba(0,0,0,0.5); border-radius: 50%;">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      </button>
      <button class="carousel-control-next position-absolute top-50 end-0 translate-middle-y border border-primary" type="button" data-bs-target="#popularProductsCarousel" data-bs-slide="next" style="width: 50px; height: 50px; background-color: rgba(0,0,0,0.5); border-radius: 50%;">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
      </button>
    </div>
  </div>
</div>


```

**Stack Trace (top frames):**
```
["/Users/mac/Desktop/nikson-fishing-server/app/views/main/dashboards/index.html.erb:108: syntax error, unexpected `end'", "          end", "          ^~~", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:502:in `module_eval'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:502:in `compile'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:433:in `block (2 levels) in compile!'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `block in instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications/instrumenter.rb:58:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/tracing.rb:56:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:579:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:432:in `block in compile!'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:424:in `synchronize'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:424:in `compile!'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:273:in `block in render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `block in instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications/instrumenter.rb:58:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/tracing.rb:56:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:583:in `instrument_render_template'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/template.rb:272:in `render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/renderer/template_renderer.rb:66:in `block (2 levels) in render_template'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `block in instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications/instrumenter.rb:58:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/tracing.rb:56:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/renderer/template_renderer.rb:60:in `block in render_template'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/renderer/template_renderer.rb:76:in `block in render_with_layout'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `block in instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications/instrumenter.rb:58:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/tracing.rb:56:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/renderer/template_renderer.rb:75:in `render_with_layout'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/renderer/template_renderer.rb:59:in `render_template'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/renderer/template_renderer.rb:11:in `render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/renderer/renderer.rb:58:in `render_template_to_object'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/renderer/renderer.rb:31:in `render_to_object'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/rendering.rb:136:in `block in _render_template'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/base.rb:305:in `in_rendering_context'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/rendering.rb:135:in `_render_template'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/streaming.rb:179:in `_render_template'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/rendering.rb:122:in `render_to_body'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/rendering.rb:186:in `render_to_body'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/renderers.rb:140:in `render_to_body'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/abstract_controller/rendering.rb:28:in `render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/rendering.rb:167:in `render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/instrumentation.rb:31:in `block (2 levels) in render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/benchmark.rb:17:in `realtime'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/instrumentation.rb:31:in `block in render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/instrumentation.rb:100:in `cleanup_view_runtime'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activerecord-8.0.4/lib/active_record/railties/controller_runtime.rb:46:in `cleanup_view_runtime'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/instrumentation.rb:30:in `render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/implicit_render.rb:39:in `default_render'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/basic_implicit_render.rb:9:in `send_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/abstract_controller/base.rb:215:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/rendering.rb:193:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/abstract_controller/callbacks.rb:261:in `block in process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:120:in `block in run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/turbo-rails-2.0.20/lib/turbo-rails.rb:24:in `with_request_id'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/turbo-rails-2.0.20/app/controllers/concerns/turbo/request_id_tracking.rb:10:in `turbo_tracking_request_id'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:129:in `block in run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actiontext-8.0.4/lib/action_text/rendering.rb:25:in `with_renderer'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actiontext-8.0.4/lib/action_text/engine.rb:71:in `block (4 levels) in <class:Engine>'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:129:in `instance_exec'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:129:in `block in run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/controller_transaction.rb:21:in `block in sentry_around_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/hub.rb:146:in `block in with_child_span'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/span.rb:232:in `with_child_span'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/hub.rb:144:in `with_child_span'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry-ruby.rb:526:in `with_child_span'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/controller_transaction.rb:18:in `sentry_around_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:129:in `block in run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:140:in `run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/abstract_controller/callbacks.rb:260:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/rescue.rb:27:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/instrumentation.rb:76:in `block in process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `block in instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications/instrumenter.rb:58:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/tracing.rb:56:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/instrumentation.rb:75:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/params_wrapper.rb:259:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activerecord-8.0.4/lib/active_record/railties/controller_runtime.rb:39:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/abstract_controller/base.rb:152:in `process'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/rendering.rb:40:in `process'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal.rb:252:in `dispatch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal.rb:335:in `dispatch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/routing/route_set.rb:67:in `dispatch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/routing/route_set.rb:50:in `serve'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:53:in `block in serve'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:133:in `block in find_routes'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:126:in `each'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:126:in `find_routes'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:34:in `serve'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/routing/route_set.rb:908:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/railties-8.0.4/lib/rails/engine/lazy_route_set.rb:60:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/omniauth-2.1.4/lib/omniauth/strategy.rb:202:in `call!'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/omniauth-2.1.4/lib/omniauth/strategy.rb:169:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/warden-1.2.9/lib/warden/manager.rb:36:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/warden-1.2.9/lib/warden/manager.rb:34:in `catch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/warden-1.2.9/lib/warden/manager.rb:34:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/tempfile_reaper.rb:20:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/etag.rb:29:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/conditional_get.rb:31:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/head.rb:15:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/http/permissions_policy.rb:38:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/http/content_security_policy.rb:38:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-session-2.1.1/lib/rack/session/abstract/id.rb:274:in `context'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-session-2.1.1/lib/rack/session/abstract/id.rb:268:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/cookies.rb:706:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activerecord-8.0.4/lib/active_record/migration.rb:670:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/callbacks.rb:31:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:100:in `run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/callbacks.rb:30:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/executor.rb:16:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activerabbit-ai-0.6.2/lib/active_rabbit/middleware/error_capture_middleware.rb:11:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/rescued_exception_interceptor.rb:14:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/debug_exceptions.rb:31:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/web-console-4.2.1/lib/web_console/middleware.rb:132:in `call_app'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/web-console-4.2.1/lib/web_console/middleware.rb:28:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/web-console-4.2.1/lib/web_console/middleware.rb:17:in `catch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/web-console-4.2.1/lib/web_console/middleware.rb:17:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/rack/capture_exceptions.rb:30:in `block (2 levels) in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/hub.rb:333:in `with_session_tracking'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry-ruby.rb:419:in `with_session_tracking'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/rack/capture_exceptions.rb:21:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/hub.rb:89:in `with_scope'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry-ruby.rb:399:in `with_scope'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/rack/capture_exceptions.rb:20:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/show_exceptions.rb:32:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/railties-8.0.4/lib/rails/rack/logger.rb:41:in `call_app'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/railties-8.0.4/lib/rails/rack/logger.rb:29:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/remote_ip.rb:96:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/request_id.rb:34:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/method_override.rb:28:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/runtime.rb:24:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/server_timing.rb:61:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/server_timing.rb:26:in `collect_events'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/server_timing.rb:60:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rails_live_reload-0.5.0/lib/rails_live_reload/middleware/base.rb:19:in `call!'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rails_live_reload-0.5.0/lib/rails_live_reload/middleware/base.rb:9:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/executor.rb:16:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/propshaft-1.3.1/lib/propshaft/server.rb:37:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/static.rb:27:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/sendfile.rb:131:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/host_authorization.rb:143:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-mini-profiler-4.0.1/lib/mini_profiler.rb:334:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/railties-8.0.4/lib/rails/engine.rb:535:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/configuration.rb:300:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/request.rb:101:in `block in handle_request'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/thread_pool.rb:355:in `with_force_shutdown'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/request.rb:100:in `handle_request'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/server.rb:503:in `process_client'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/server.rb:262:in `block in run'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/thread_pool.rb:182:in `block in spawn_thread'"]
```

**Request Context:**
- Method: `GET`
- Path: `/`

## 🛡️ Prevention

- Always use `do` keyword with block iterators in ERB: `<% collection.each do |item| %>`
- Use a linter or syntax checker for ERB templates
- Test template rendering after making changes
- Be careful with copy-paste operations that might introduce invalid characters

## ✅ Checklist

- [ ] Code fix implemented
- [ ] Tests added/updated
- [ ] Error scenario manually verified
- [ ] No regressions introduced

---
_Generated by [ActiveRabbit](https://activerabbit.ai) AI_

---
_Generated by [ActiveRabbit](https://activerabbit.ai) AI_