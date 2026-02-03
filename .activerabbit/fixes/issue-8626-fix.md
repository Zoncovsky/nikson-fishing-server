# Fix for RuntimeError

**Issue ID:** 8626
**Generated:** 2026-02-03 18:42 UTC
**Status:** 📋 Suggestion only (manual review required)

## Suggested Code Fix

```ruby
  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "is_new_arrival", "is_popular", "name", "price", "updated_at"]
  end

```

## Full Analysis

## 🐛 Bug Fix: RuntimeError

**Issue ID:** #8626
**Controller:** `Main::DashboardsController#catalog`
**Occurrences:** 1 times
**First seen:** 2026-02-03 18:41
**Last seen:** 2026-02-03 18:41

## 🔍 Root Cause Analysis

Ransack gem requires explicit allowlisting of searchable attributes for security reasons. The `Product` model is missing the required `ransackable_attributes` class method.

## 🔧 Suggested Fix

Add the `ransackable_attributes` method to your `Product` model:

```ruby
class Product < ApplicationRecord
  # ... existing code ...

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "is_new_arrival", "is_popular", "name", "price", "updated_at"]
  end

  # ... rest of model ...
end
```

The error message helpfully provides the exact method you need. Copy and paste it into your `Product` model.

## 📋 Error Details

**Error Message:**
```
Ransack needs Product attributes explicitly allowlisted as
searchable. Define a `ransackable_attributes` class method in your `Product`
model, watching out for items you DON'T want searchable (for
example, `encrypted_password`, `password_reset_token`, `owner` or
other sensitive information). You can use the following as a base:

```ruby
class Product < ApplicationRecord

  # ...

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "is_new_arrival", "is_popular", "name", "price", "updated_at"]
  end

  # ...

end
```

```

**Stack Trace (top frames):**
```
["/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/adapters/active_record/base.rb:112:in `deprecated_ransackable_list'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/adapters/active_record/base.rb:38:in `ransackable_attributes'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/context.rb:162:in `ransackable_attribute?'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/adapters/active_record/context.rb:68:in `attribute_method?'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/nodes/grouping.rb:126:in `attribute_method?'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/search.rb:54:in `block in build'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/search.rb:49:in `each'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/search.rb:49:in `build'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/search.rb:41:in `initialize'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/adapters/active_record/base.rb:16:in `new'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/ransack-4.4.1/lib/ransack/adapters/active_record/base.rb:16:in `ransack'", "/Users/mac/Desktop/nikson-fishing-server/app/controllers/main/dashboards_controller.rb:27:in `load_products'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:361:in `block in make_lambda'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:178:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/abstract_controller/callbacks.rb:34:in `block (2 levels) in <module:Callbacks>'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:179:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:559:in `block in invoke_before'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:559:in `each'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:559:in `invoke_before'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:118:in `block in run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/turbo-rails-2.0.20/lib/turbo-rails.rb:24:in `with_request_id'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/turbo-rails-2.0.20/app/controllers/concerns/turbo/request_id_tracking.rb:10:in `turbo_tracking_request_id'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:129:in `block in run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actiontext-8.0.4/lib/action_text/rendering.rb:25:in `with_renderer'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actiontext-8.0.4/lib/action_text/engine.rb:71:in `block (4 levels) in <class:Engine>'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:129:in `instance_exec'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:129:in `block in run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/controller_transaction.rb:21:in `block in sentry_around_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/hub.rb:146:in `block in with_child_span'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/span.rb:232:in `with_child_span'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/hub.rb:144:in `with_child_span'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry-ruby.rb:526:in `with_child_span'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/controller_transaction.rb:18:in `sentry_around_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:129:in `block in run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:140:in `run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/abstract_controller/callbacks.rb:260:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/rescue.rb:27:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/instrumentation.rb:76:in `block in process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `block in instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications/instrumenter.rb:58:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/tracing.rb:56:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/notifications.rb:210:in `instrument'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/instrumentation.rb:75:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal/params_wrapper.rb:259:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activerecord-8.0.4/lib/active_record/railties/controller_runtime.rb:39:in `process_action'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/abstract_controller/base.rb:152:in `process'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionview-8.0.4/lib/action_view/rendering.rb:40:in `process'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal.rb:252:in `dispatch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_controller/metal.rb:335:in `dispatch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/routing/route_set.rb:67:in `dispatch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/routing/route_set.rb:50:in `serve'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:53:in `block in serve'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:133:in `block in find_routes'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:126:in `each'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:126:in `find_routes'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/journey/router.rb:34:in `serve'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/routing/route_set.rb:908:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/railties-8.0.4/lib/rails/engine/lazy_route_set.rb:60:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/omniauth-2.1.4/lib/omniauth/strategy.rb:202:in `call!'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/omniauth-2.1.4/lib/omniauth/strategy.rb:169:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/warden-1.2.9/lib/warden/manager.rb:36:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/warden-1.2.9/lib/warden/manager.rb:34:in `catch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/warden-1.2.9/lib/warden/manager.rb:34:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/tempfile_reaper.rb:20:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/etag.rb:29:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/conditional_get.rb:31:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/head.rb:15:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/http/permissions_policy.rb:38:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/http/content_security_policy.rb:38:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-session-2.1.1/lib/rack/session/abstract/id.rb:274:in `context'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-session-2.1.1/lib/rack/session/abstract/id.rb:268:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/cookies.rb:706:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activerecord-8.0.4/lib/active_record/migration.rb:670:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/callbacks.rb:31:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activesupport-8.0.4/lib/active_support/callbacks.rb:100:in `run_callbacks'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/callbacks.rb:30:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/executor.rb:16:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/activerabbit-ai-0.6.2/lib/active_rabbit/middleware/error_capture_middleware.rb:11:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-rails-6.3.0/lib/sentry/rails/rescued_exception_interceptor.rb:14:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/debug_exceptions.rb:31:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/web-console-4.2.1/lib/web_console/middleware.rb:132:in `call_app'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/web-console-4.2.1/lib/web_console/middleware.rb:28:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/web-console-4.2.1/lib/web_console/middleware.rb:17:in `catch'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/web-console-4.2.1/lib/web_console/middleware.rb:17:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/rack/capture_exceptions.rb:30:in `block (2 levels) in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/hub.rb:333:in `with_session_tracking'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry-ruby.rb:419:in `with_session_tracking'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/rack/capture_exceptions.rb:21:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/hub.rb:89:in `with_scope'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry-ruby.rb:399:in `with_scope'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/sentry-ruby-6.3.0/lib/sentry/rack/capture_exceptions.rb:20:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/show_exceptions.rb:32:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/railties-8.0.4/lib/rails/rack/logger.rb:41:in `call_app'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/railties-8.0.4/lib/rails/rack/logger.rb:29:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/remote_ip.rb:96:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/request_id.rb:34:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/method_override.rb:28:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/runtime.rb:24:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/server_timing.rb:61:in `block in call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/server_timing.rb:26:in `collect_events'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/server_timing.rb:60:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rails_live_reload-0.5.0/lib/rails_live_reload/middleware/base.rb:19:in `call!'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rails_live_reload-0.5.0/lib/rails_live_reload/middleware/base.rb:9:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/executor.rb:16:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/propshaft-1.3.1/lib/propshaft/server.rb:37:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/static.rb:27:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-3.2.4/lib/rack/sendfile.rb:131:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/actionpack-8.0.4/lib/action_dispatch/middleware/host_authorization.rb:143:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/rack-mini-profiler-4.0.1/lib/mini_profiler.rb:334:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/railties-8.0.4/lib/rails/engine.rb:535:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/configuration.rb:300:in `call'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/request.rb:101:in `block in handle_request'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/thread_pool.rb:355:in `with_force_shutdown'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/request.rb:100:in `handle_request'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/server.rb:503:in `process_client'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/server.rb:262:in `block in run'", "/Users/mac/.asdf/installs/ruby/3.3.6/lib/ruby/gems/3.3.0/gems/puma-7.1.0/lib/puma/thread_pool.rb:182:in `block in spawn_thread'"]
```

**Request Context:**
- Method: `GET`
- Path: `/catalog?q%5Bname_cont%5D=feed&q%5Bprice_gteq%5D=&q%5Bprice_lteq%5D=&q%5Bcategory_id_eq%5D=&commit=Search`

## 🛡️ Prevention

- Always define `ransackable_attributes` when using Ransack gem
- Only include attributes you want users to search/filter by
- Exclude sensitive fields like passwords, tokens, or private data
- Consider using `ransackable_associations` if you need to search related models
- Review the attribute list periodically when adding new model fields

## ✅ Checklist

- [ ] Code fix implemented
- [ ] Tests added/updated
- [ ] Error scenario manually verified
- [ ] No regressions introduced

---
_Generated by [ActiveRabbit](https://activerabbit.ai) AI_

---
_Generated by [ActiveRabbit](https://activerabbit.ai) AI_