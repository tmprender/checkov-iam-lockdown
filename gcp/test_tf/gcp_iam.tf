provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

resource "google_service_account" "test_service_account" {
  account_id   = "test-account"
  display_name = "Test Service Account"
}

resource "google_service_account_key" "test_service_account_key" {
  service_account_id = google_service_account.test_service_account.name
}

resource "google_project_iam_binding" "test_project_iam_binding" {
  project = "your-gcp-project-id"
  role    = "roles/editor"
  members = [
    "serviceAccount:${google_service_account.test_service_account.email}",
  ]
}

resource "google_project_iam_member" "test_project_iam_member" {
  project = "your-gcp-project-id"
  role   = "roles/viewer"
  member = "user:viewer@example.com"
}

resource "google_project_iam_policy" "test_project_iam_policy" {
  project     = "your-gcp-project-id"
  policy_data = data.google_iam_policy.test_policy.policy_data
}

data "google_iam_policy" "test_policy" {
  binding {
    role = "roles/viewer"
    members = [
      "user:viewer@example.com",
    ]
  }
}

resource "google_organization_iam_binding" "test_org_iam_binding" {
  org_id = "your-org-id"
  role   = "roles/resourcemanager.organizationAdmin"
  members = [
    "user:admin@example.com",
  ]
}

resource "google_organization_iam_member" "test_org_iam_member" {
  org_id = "your-org-id"
  role   = "roles/logging.logWriter"
  member = "user:logwriter@example.com"
}

resource "google_organization_iam_policy" "test_org_iam_policy" {
  org_id      = "your-org-id"
  policy_data = data.google_iam_policy.test_policy.policy_data
}

resource "google_folder_iam_binding" "test_folder_iam_binding" {
  folder  = "your-folder-id"
  role    = "roles/resourcemanager.folderEditor"
  members = [
    "user:editor@example.com",
  ]
}

resource "google_folder_iam_member" "test_folder_iam_member" {
  folder = "your-folder-id"
  role   = "roles/resourcemanager.folderViewer"
  member = "user:viewer@example.com"
}

resource "google_folder_iam_policy" "test_folder_iam_policy" {
  folder      = "your-folder-id"
  policy_data = data.google_iam_policy.test_policy.policy_data
}