Automated PR context from ActiveRabbit

### Root Cause Analysis

The error you are encountering is a `ZeroDivisionError` occurring in the `Main::DashboardsController#index` action, specifically at line 7 of `dashboards_controller.rb`. This indicates that there is an attempt to divide by zero in your code.

### Likely Root Cause
The most probable cause of this error is that a division operation is being performed where the divisor is zero. This could happen if you are calculating a percentage, average, or any other metric that involves division, and the value being used as the divisor is not properly validated.

### Suggested Fixes
1. **Check the Division Logic**: Review line 7 of `dashboards_controller.rb` to identify the division operation. Ensure that the divisor is not zero before performing the division. For example:
   ```ruby
   # Example of the problematic line
   result = numerator / denominator

   # Fix it by adding a check
   if denominator.zero?
     # Handle the zero case, e.g., set result to nil or a default value
     result = 0 # or some other appropriate value
   else
     result = numerator / denominator
   end
   ```

2. **Add Validation**: If the divisor comes from user input or a database query, ensure that you validate it before performing the division. You can add error handling or default values to prevent the division by zero.

3. **Logging**: Consider adding logging around the division operation to capture the values of the numerator and denominator. This will help you debug the issue in the future if it arises again.

4. **Unit Tests**: If you have not already, write unit tests for the `index` action to cover cases where the denominator could be zero. This will help catch similar issues during development.

By implementing these changes, you should be able to prevent the `ZeroDivisionError` from occurring in your application.


### Reproduction

divided by 0


### Tests

- [ ] Add/verify tests reproducing the error and the fix