---
inclusion: always
---

# Kiro Instructions — Large-Scale iOS Swift/VIPER Project

You are an AI coding agent working on an existing, large-scale production iOS application written in Swift, using UIKit, SwiftUI, and VIPER architecture.

These instructions are GLOBAL and MUST be applied to every task unless the user explicitly overrides them.

==================================================
1. CORE PRINCIPLE — EXISTING CODEBASE IS THE SOURCE OF TRUTH
==================================================

Treat the existing codebase as the source of truth.

Before writing or modifying code:

- Inspect the relevant implementation.
- Search the repository for existing implementations of the requested functionality.
- Search for similar features, API calls, models, protocols, managers, utilities, routers, presenters, interactors, and UI components.
- Understand how the existing feature is structured before making changes.
- Follow existing project conventions instead of inventing new patterns.

NEVER assume something does not exist until you search for it.

NEVER create a new implementation when an existing implementation can reasonably be reused.

Prefer:
    Existing implementation > Extension of existing implementation > Small reusable abstraction > New implementation

==================================================
2. MINIMAL CHANGE POLICY
==================================================

Make the smallest safe change that completely solves the requested problem.

DO NOT:

- Refactor unrelated code.
- Rename unrelated classes or methods.
- Reformat unrelated files.
- Change working architecture.
- Replace existing patterns unnecessarily.
- Introduce new frameworks unnecessarily.
- Change public APIs unnecessarily.
- Change behavior outside the requested scope.
- Rewrite an entire file when only a few lines need modification.

If only 5 lines need to change, do not rewrite 100 lines.

Preserve existing behavior unless the requested task explicitly changes that behavior.

When multiple solutions are possible, prefer the solution with:

1. Lowest regression risk
2. Smallest code change
3. Best alignment with existing architecture
4. Highest reuse
5. Simplest implementation

==================================================
3. CODEBASE DISCOVERY — REQUIRED BEFORE IMPLEMENTATION
==================================================

For any non-trivial task, perform repository discovery first.

Look for:

- Similar features
- Similar API calls
- Existing protocols
- Existing services
- Existing managers
- Existing helpers
- Existing extensions
- Existing models
- Existing error types
- Existing navigation patterns
- Existing VIPER modules
- Existing ViewModels
- Existing dependency injection
- Existing notification handling
- Existing persistence/UserDefaults patterns
- Existing logging
- Existing tests

Use the existing implementation as the template whenever possible.

If a similar feature exists, follow its structure instead of creating a new architecture.

==================================================
4. ARCHITECTURE — VIPER IS THE DEFAULT
==================================================

The project uses VIPER architecture.

For new features, follow the existing VIPER implementation strictly.

Responsibilities:

VIEW
- UI rendering
- User interaction
- View lifecycle
- Forward user actions to Presenter
- Display data provided by Presenter

PRESENTER
- Presentation logic
- Convert Interactor results into View-ready data
- Coordinate View updates
- Handle presentation-specific state
- Do not perform networking directly unless the existing architecture explicitly does so

INTERACTOR
- Business logic
- API/service interaction
- Data operations
- Business rules
- Coordinate required data sources

ENTITY
- Models
- Request/response models
- Feature-specific data structures

ROUTER
- Navigation
- Module creation
- Transition logic
- Deep-link routing where applicable

DO NOT move responsibilities between VIPER layers merely for convenience.

Do not place:

- Networking in View
- Business logic in View
- Navigation logic in Interactor
- API calls directly inside View
- UI-specific logic inside Entity
- Business logic inside Router

Follow the project's EXISTING VIPER variation if it differs slightly from textbook VIPER.

Existing project conventions take priority over theoretical VIPER purity.

==================================================
5. NEW FEATURE RULES
==================================================

When implementing a new feature:

STEP 1
Search for similar functionality.

STEP 2
Identify the existing VIPER module pattern.

STEP 3
Identify reusable components.

STEP 4
Identify required API/service dependencies.

STEP 5
Determine the correct VIPER layer for each responsibility.

STEP 6
Implement only the required changes.

STEP 7
Validate integration with existing navigation and lifecycle.

Do not create an entirely new architecture for a feature that can fit into the existing architecture.

If a new abstraction is required, keep it focused and reusable.

==================================================
6. BUG FIX RULES
==================================================

For bug fixes:

DO NOT immediately rewrite the code.

First determine:

- What is the expected behavior?
- What is the actual behavior?
- Where does the behavior diverge?
- What is the root cause?
- Is the problem caused by state?
- Is it caused by threading?
- Is it caused by lifecycle?
- Is it caused by duplicate API calls?
- Is it caused by asynchronous execution?
- Is it caused by navigation?
- Is it caused by optional/nil handling?
- Is it caused by incorrect caching/persistence?
- Is it caused by a race condition?

Fix the root cause rather than masking the symptom.

Prefer:

    Root-cause fix > Workaround

Do not introduce additional flags, delays, timers, retries, or state variables unless they are actually necessary.

==================================================
7. REUSE — DO NOT DUPLICATE CODE
==================================================

Before creating:

- Helper
- Utility
- Manager
- Service
- API method
- Formatter
- Extension
- View
- Component
- Protocol
- Model

Search for an existing equivalent.

If existing functionality is close but not completely suitable:

- Extend it if appropriate.
- Generalize it only if there is a genuine reuse case.
- Avoid breaking existing callers.

Do not duplicate business logic in multiple layers.

If the same logic appears repeatedly, consider extracting it only when doing so improves maintainability without unnecessary abstraction.

==================================================
8. AVOID OVER-ENGINEERING
==================================================

Do not over-engineer simple requirements.

Do not create:

- Unnecessary protocols
- Unnecessary managers
- Unnecessary factories
- Unnecessary wrappers
- Unnecessary generic types
- Unnecessary dependency layers
- Unnecessary state machines
- Unnecessary abstractions

A simple requirement should have a simple solution.

Use abstraction when it solves a real problem:

- Reuse
- Testability
- Separation of responsibility
- Dependency management
- Complexity reduction

Not simply because an abstraction is theoretically possible.

==================================================
9. SWIFT QUALITY RULES
==================================================

Write idiomatic Swift.

Prefer:

- guard for early exits
- let over var
- appropriate access control
- strongly typed models
- safe optional handling
- small focused methods
- clear naming
- existing project conventions

Avoid:

- Force unwraps unless demonstrably safe
- Force casts unless unavoidable and guaranteed
- Deep nesting
- Massive methods
- Duplicate conditions
- Duplicate API calls
- Hidden side effects
- Unnecessary temporary variables
- Global mutable state

Do not change existing code merely to make it stylistically "more modern" unless requested.

==================================================
10. OPTIONAL HANDLING
==================================================

Handle optionals deliberately.

Do not blindly replace:

    optionalValue

with:

    optionalValue!

Do not introduce default values merely to suppress compiler errors if nil has meaningful semantics.

Understand whether nil means:

- Missing data
- API failure
- Not configured
- Not applicable
- Loading
- Unknown

Preserve existing semantic behavior.

==================================================
11. ASYNC / CONCURRENCY
==================================================

Pay special attention to asynchronous code.

Before modifying async flows, understand:

- Completion handlers
- DispatchQueue
- DispatchGroup
- async/await
- Tasks
- MainActor
- Timers
- NotificationCenter
- Delegates
- Combine publishers
- Callbacks

Avoid:

- Duplicate API calls
- Multiple completion callbacks
- Calling completion before all required operations finish
- Calling completion more than once
- Race conditions
- Updating UI from a background thread
- Retain cycles
- Tasks continuing after their owner is gone
- Unnecessary nested async operations

For parallel API calls, ensure:

- Each operation completes correctly.
- Failures are handled correctly.
- Shared state is not corrupted.
- Completion is triggered exactly once.
- Partial failure behavior matches existing requirements.

Do not introduce concurrency changes unless necessary.

==================================================
12. API / NETWORKING
==================================================

Always reuse the existing networking architecture.

Before adding an API call, search for:

- Existing endpoint
- Existing service
- Existing request model
- Existing response model
- Existing API wrapper
- Existing error handling
- Existing authentication handling

Do not create a second implementation of an existing endpoint.

Verify:

- HTTP method
- Parameters
- Headers
- Request body
- Response model
- Error handling
- Authentication
- Retry behavior
- Threading

Do not silently change API behavior.

Avoid unnecessary repeated API calls.

If multiple API calls are required, clearly understand whether they should be:

- Sequential
- Parallel
- Conditional
- Dependent on previous results

==================================================
13. STATE MANAGEMENT
==================================================

Be extremely careful when modifying state.

Before adding state variables, determine whether the information already exists in:

- ViewModel
- Presenter
- Interactor
- Manager
- Singleton
- UserDefaults
- App Group storage
- Existing model
- Existing cache

Do not create duplicate sources of truth.

Avoid boolean flags that merely compensate for incorrect state management.

If a state variable is required, give it a clear lifecycle and ownership.

==================================================
14. USERDEFAULTS / PERSISTENCE
==================================================

Reuse existing persistence mechanisms.

Do not directly access UserDefaults if the project already provides:

- UserDefaultsManager
- AppGroupDefaultsManager
- Storage manager
- Repository
- Persistence abstraction

Follow the existing getter/setter patterns.

Be careful with:

- Default values
- Optional values
- Logout/reset behavior
- App group storage
- Data migration
- Stale state

Do not introduce a new persistence mechanism for an existing type of data.

==================================================
15. NAVIGATION
==================================================

Follow the project's existing navigation architecture.

Before changing navigation:

- Inspect Router/NavigationRouter.
- Inspect existing route enums.
- Inspect deep-link handling.
- Inspect navigation stack behavior.
- Inspect modal/push presentation patterns.
- Inspect UIKit/SwiftUI bridging.

Do not introduce a second navigation mechanism unless absolutely necessary.

Be careful with:

- Duplicate screens
- popToRootViewController
- Presenting from an incorrect controller
- Navigation stack duplication
- Deep links
- Background/foreground transitions
- Cold launch
- Scene lifecycle

Navigation changes must preserve existing flows.

==================================================
16. SWIFTUI + UIKIT
==================================================

The project may contain both SwiftUI and UIKit.

Respect the existing boundary.

Before introducing a bridge:

- Search for existing UIKit/SwiftUI integration patterns.
- Reuse existing wrappers where possible.
- Follow the project's navigation approach.

Do not unnecessarily convert UIKit code to SwiftUI or vice versa.

Do not introduce a new presentation pattern merely because it is newer.

==================================================
17. MEMORY MANAGEMENT
==================================================

Consider memory management for:

- Closures
- Delegates
- Timers
- NotificationCenter
- Combine
- Tasks
- Async callbacks
- Long-lived managers
- Singletons

Avoid retain cycles.

Do not automatically use `[weak self]` everywhere without understanding ownership.

Use weak references where appropriate based on lifecycle and ownership.

==================================================
18. SINGLETONS
==================================================

Do not introduce new singletons unless there is a strong architectural reason.

Before using an existing singleton, understand:

- Its lifecycle
- Whether state survives logout
- Whether state survives app restart
- Whether state is thread-safe
- Whether it can contain stale state

Do not use a singleton simply because it is convenient.

==================================================
19. LOGGING
==================================================

Follow the project's existing logging mechanism.

Do not add excessive logs.

Logs should be useful for:

- API failures
- Important state transitions
- Unexpected conditions
- Navigation problems
- Critical debugging information

Do not log sensitive information such as:

- Tokens
- Passwords
- Personal information
- Authentication credentials
- Sensitive API payloads

==================================================
20. COMMENTS
==================================================

Comments must be minimal.

DO NOT add comments for obvious code.

Bad:

// Check if vehicle exists
if vehicle != nil { ... }

Bad:

// Return the result
return result

Only add comments when they explain:

- Non-obvious business logic
- Important technical limitations
- Workarounds
- Known platform behavior
- Reason for unusual implementation

Keep comments short.

==================================================
21. NAMING
==================================================

Use names that describe intent.

Do not rename existing APIs unnecessarily.

For new code:

- Use descriptive names.
- Follow existing project naming conventions.
- Avoid abbreviations unless already established by the project.
- Avoid names such as:
    data
    temp
    obj
    manager2
    newValue
    result2

unless their context genuinely makes them clear.

==================================================
22. ERROR HANDLING
==================================================

Follow existing error-handling patterns.

Do not:

- Ignore errors silently.
- Convert meaningful errors into generic errors unnecessarily.
- Add fake fallback values just to avoid handling failure.
- Hide API failures.
- Swallow exceptions/errors.

If an error is intentionally ignored, there should be a clear reason.

==================================================
23. PERFORMANCE
==================================================

Write efficient code, but do not prematurely optimize.

Pay attention to:

- Repeated API calls
- Repeated expensive calculations
- Large loops
- Unnecessary allocations
- Repeated JSON decoding
- Main-thread work
- Image loading
- Timers
- Polling
- Retain cycles

Do not sacrifice readability for insignificant micro-optimizations.

Optimize when there is a meaningful performance impact.

==================================================
24. POLLING / TIMERS
==================================================

Be particularly careful with polling and timers.

Before adding or modifying polling:

- Check whether an existing timer already performs the operation.
- Ensure only one timer is active when intended.
- Ensure timers are invalidated appropriately.
- Consider app lifecycle.
- Consider logout.
- Consider navigation away from the feature.
- Avoid duplicate API requests.

Never add a timer as a quick workaround for an asynchronous/state problem without understanding the root cause.

==================================================
25. THREADING / UI
==================================================

UI updates must occur on the appropriate thread/main actor.

Be careful when API callbacks or background operations modify:

- SwiftUI state
- UIKit views
- ViewModels
- Presenters
- Navigation
- Shared state

Do not blindly dispatch everything to the main thread.

Only perform UI-related work on the main thread.

==================================================
26. TESTING
==================================================

When tests exist, follow the project's existing testing style.

For changes involving business logic, consider relevant test cases such as:

- Success
- Failure
- Nil data
- Empty data
- Invalid data
- Boundary conditions
- Multiple API responses
- Duplicate callbacks
- Concurrent execution

Do not modify tests merely to make them pass.

If existing behavior intentionally changes, update tests accordingly.

==================================================
27. BACKWARD COMPATIBILITY
==================================================

Respect:

- Existing public APIs
- Existing module interfaces
- Existing callers
- Existing persisted data
- Existing navigation routes
- Existing deep links
- Existing API contracts

Do not introduce breaking changes without explicit approval.

==================================================
28. FILE AND CODE ORGANIZATION
==================================================

Keep code in the appropriate existing location.

Before creating a new file, determine whether the functionality belongs in:

- Existing class
- Existing extension
- Existing protocol
- Existing utility
- Existing VIPER component

Do not create files simply to hold a few lines of code unless the project structure supports that pattern.

==================================================
29. DO NOT MAKE UNREQUESTED IMPROVEMENTS
==================================================

If the user asks:

"Fix X"

Only fix X.

Do not additionally:

- Refactor Y
- Rename Z
- Change formatting
- Upgrade dependencies
- Rewrite architecture
- Change unrelated API handling
- Modernize unrelated Swift code

If you identify an unrelated improvement, mention it separately only if it is important.

Do not implement it automatically.

==================================================
30. CHANGE IMPACT ANALYSIS
==================================================

Before making changes, determine:

- Which files are affected?
- Which callers depend on the code?
- Which protocols are involved?
- Which API flows are involved?
- Which navigation flows are involved?
- Whether the change affects shared state.
- Whether the change affects other modules.

Prefer localized changes.

For high-impact changes, explicitly state the potential impact before implementation.

==================================================
31. DO NOT GUESS PROJECT-SPECIFIC BEHAVIOR
==================================================

If the repository contains evidence about behavior, use that evidence.

Do not invent:

- API behavior
- Model properties
- Route names
- Protocol methods
- Framework usage
- Business rules
- Default values

Search the codebase first.

If required information cannot be determined from the repository, clearly state what is missing instead of silently guessing.

==================================================
32. IMPLEMENTATION RESPONSE STYLE
==================================================

For simple tasks:

- Make the change directly.
- Keep the explanation short.

For complex tasks:

Before implementation, briefly provide:

1. Existing implementation found
2. Root cause / requirement
3. Proposed change
4. Files/components affected

After implementation, briefly provide:

1. What changed
2. Why
3. Any important side effects
4. Validation performed

Do not provide lengthy explanations for simple code changes.

==================================================
33. FINAL SELF-CHECK BEFORE COMPLETING A TASK
==================================================

Before considering the task complete, verify:

[ ] Did I search for an existing implementation?
[ ] Did I reuse existing functionality where appropriate?
[ ] Did I preserve existing behavior?
[ ] Did I follow the existing VIPER structure?
[ ] Did I keep responsibilities in the correct layer?
[ ] Did I avoid unnecessary files/classes/protocols?
[ ] Did I avoid duplicate API calls?
[ ] Did I handle optionals safely?
[ ] Did I consider async/threading issues?
[ ] Did I consider retain cycles?
[ ] Did I avoid unnecessary state?
[ ] Did I avoid unrelated refactoring?
[ ] Did I avoid unnecessary comments?
[ ] Did I follow existing naming/conventions?
[ ] Did I avoid introducing unnecessary dependencies?
[ ] Did I consider navigation/lifecycle impact?
[ ] Did I preserve backward compatibility?
[ ] Did I make the smallest safe change?
[ ] Does the implementation solve the root cause?
[ ] Does the code remain maintainable?

==================================================
34. ABSOLUTE PRIORITY
==================================================

When making implementation decisions, follow this priority:

1. User's explicit requirement
2. Existing project behavior
3. Existing project architecture
4. Correctness
5. Minimal change
6. Reuse
7. Maintainability
8. Performance
9. Code elegance

Do not sacrifice existing project stability for theoretical architectural purity.

The goal is NOT to produce the most code.

The goal is to produce the SMALLEST, SAFEST, CLEANEST change that correctly solves the user's requirement while fitting naturally into the existing codebase.

## 35. Feature Flow Awareness

When modifying a feature, understand the complete flow before changing an individual method.

Trace where applicable:

UI
→ View
→ Presenter
→ Interactor
→ API/Service
→ Response
→ Interactor
→ Presenter
→ View

Also trace:

Deep Link
→ App/Scene lifecycle
→ Router
→ VIPER module
→ Destination

And:

API
→ State update
→ Persistence
→ UI
→ Polling/Timer
→ Lifecycle

Do not fix an issue at one point in the flow if the actual root cause exists elsewhere.

For bugs involving duplicate calls, navigation, lifecycle, polling, callbacks, or state, inspect the complete flow before implementing the fix.