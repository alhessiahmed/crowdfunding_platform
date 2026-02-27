# Project Structure

This document describes the current architecture of the `crowdfunding_platform` Flutter project.

## Top-Level

- `lib/`: main application source code
- `assets/`: images, icons, and fonts used by UI
- `pubspec.yaml`: dependencies and asset/font configuration

## `lib/` Overview

- `lib/controller/`: app logic, APIs, routing, bindings, state management, storage
- `lib/model/`: data models and response wrappers
- `lib/view/`: UI screens and reusable widgets

## Controller Layer (`lib/controller`)

### API

- `lib/controller/api/api_controllers/auth_api_controller.dart`: auth endpoints (login/register creator/institution/donor)
- `lib/controller/api/api_controllers/donor_api_controller.dart`: donor PATCH/POST operations (including multipart uploads)
- `lib/controller/api/api_controllers/discover_api_controller.dart`: discover/home campaign fetch and listing APIs
- `lib/controller/api/api_controllers/mycampagin_api_controller.dart`: my-campaigns and creator-owned campaign APIs
- `lib/controller/api/api_settings.dart`: API base URL and endpoint strings
- `lib/controller/api/api_helper.dart`: shared API headers/helpers

### GetX State Management

- `lib/controller/getx/controllers/`: feature controllers
  - `auth/`: sign in/up, onboarding, account type selection
  - `donor/`: donor verification and personal info
  - `creator/`: creator verification flow
  - other feature domains (campaign, payment, wallet, notifications, etc.)
- `lib/controller/getx/bindings/`: dependency bindings by feature and route

### Routing

- `lib/controller/core/routes/routes_manager.dart`: route name constants
- `lib/controller/core/routes/get_pages.dart`: route table (`GetPage`) + bindings
- `lib/controller/core/routes/index.dart`: barrel exports for routes/screens/bindings

### Local Storage

- `lib/controller/shared_pref/shared_pref_controller.dart`: auth/session/user persistence (`token`, `user`, `userType`)

### Localization / Core Constants

- `lib/controller/localization/`: translation maps
- `lib/controller/core/constants/`: colors, images, and shared constants

## Models (`lib/model`)

- `api_response.dart`: generic API result wrapper
- `auth_result.dart`: auth response mapping (`token` + user payload)
- `user.dart`: user entity and JSON mapping
- `sign_up_draft.dart`: signup data passed between auth flow screens
- additional domain models for campaigns, notifications, payments, etc.

## View Layer (`lib/view`)

- `lib/view/screens/`: feature screens grouped by domain
  - `auth/`: sign in/up, onboarding shell, institution steps
  - `donor/verification/`: donor verification shell and step screens
  - `creator/`: creator verification and success screens
  - additional domains (home, discover, profile, payment, wallet, campaigns)
- `lib/view/widgets/`: reusable UI components (`TextFieldWidget`, `UploadCard`, loaders, etc.)

## Project Flow (Full Coverage)

### 1) App Entry / Intro

1. `launch_screen` checks onboarding/auth state from `SharedPrefController`.
2. User goes through intro onboarding and welcome screens if first visit.
3. Navigation moves to auth or main app according to stored session.

### 2) Authentication & Account Setup

1. Sign in flow (`sign_in_controller`) calls `login` from `AuthApiController`.
2. Sign up flow (`sign_up_controller`) collects base user info and builds `SignUpDraft`.
3. User type selection (`user_type_selection_controller`) branches:
4. Donor signup: `registerDonor`.
5. Creator signup: onboarding shell then register as individual or institution.
6. Successful auth stores `token`, `user`, and `userType` in `SharedPrefController`.

### 3) Creator Onboarding & Verification

1. Multi-step creator onboarding uses `CreatorOnboardingController`.
2. Individual creator path sends profile data via `registerCreator`.
3. Institution path collects institution details + files and sends multipart via `registerInstitution`.
4. Creator verification flow (`creator_verification_controller`) is a separate post-signup flow.

### 4) Donor Verification

1. Donor account verification uses `donor_verification_shell_screen` + step screens.
2. `DonorVerificationController` handles email/phone verification steps and ID data.
3. File uploads include `idFront`, `idBack`, and `selfieWithId`.
4. Submission uses `patchDonorMultipart` in `DonorApiController`.
5. Personal profile editing (`donor_personal_info_controller`) also updates donor data using multipart.

### 5) Main Navigation & Home

1. `main_screen` routes tabs/sections based on current `userType`.
2. Donor and creator have different home entry points (`home_screen`, `donar_home_screen`).
3. Discover and campaign details flows are shared core browsing paths.

### 6) Campaign Creation Flow

1. Campaign creation uses multi-step screens in `campaign_create_screens`.
2. Controllers under `getx/controllers/campaign_create` manage step data and transitions.
3. Route constants:
4. `CampaignStepOneScreen` through `CampaignStepFiveScreen`.

### 7) Campaign Management Flow

1. Existing campaign operations live in `update_campaign` screens.
2. Controllers under `campgin_update_and_control_controllers` handle:
3. `control_campaign`, `add_update_to_campaign`, `edit_campaign_details`.

### 8) Payments Flow

1. Payment route set includes method selection, card flow, confirmation, and thanks screens.
2. Screen path chain:
3. `paymentScreen` -> `choosePaymentMethodScreen` / `addPaymentMethodScreen`
4. `creditCardPaymentScreen` -> `confirmPaymentScreen` -> `thanksForPaymentScreen`.

### 9) Wallet & Withdrawals

1. Wallet screens are in `view/screens/wallet`.
2. Controllers/bindings under `getx/controllers/wallet` and corresponding bindings manage:
3. wallet summary, withdrawal request, and withdrawal summary flows.

### 10) Profile / Security / Activity

1. Profile entry supports donor personal info and creator/donor verification links.
2. Security routes include `securityPrivacyScreen`, `changePasswordScreen`, and `loginActivityScreen`.
3. Notification settings and account history are available from profile routes.

### 11) Notifications & History

1. Notifications feature uses dedicated screens/controllers/bindings under `notification`.
2. Donation history has dedicated list/detail UI and state flow under `donation_history`.

### 12) Routing + DI Backbone

1. All route names are centralized in `routes_manager.dart`.
2. `get_pages.dart` maps each route to screen + binding.
3. Bindings instantiate feature controllers and attach them to route lifecycle.
4. `index.dart` provides route-related barrel exports.

## Notes

- State is managed with GetX controllers and reactive vars (`Rx`, `Rxn`).
- Dependency injection is done via bindings per route.
- Most API interactions return `ApiResponse<T>` for unified success/error handling.
