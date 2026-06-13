# Publishing to Power BI Service

## Prerequisites

- Power BI Desktop (already installed)
- Power BI account (free or Pro)
- On-premises data gateway (required for PostgreSQL — Power BI Service cannot reach a local DB directly)

## Step 1 — Install the On-Premises Data Gateway

1. Download from: Power BI Service → Settings → Manage gateways → Download gateway
2. Install on the machine running PostgreSQL (or any machine that can reach it)
3. Sign in with your Power BI account during setup
4. The gateway registers itself automatically in Power BI Service

## Step 2 — Configure the gateway data source

1. Power BI Service → Settings → Manage gateways → your gateway → Add data source
2. Data source type: **PostgreSQL**
3. Fill in: server, database (`salesdb`), authentication (username/password)
4. Save and verify the connection

## Step 3 — Publish from Power BI Desktop

1. Open `powerbi/sales_dashboard.pbix`
2. Home → **Publish** → sign in if prompted
3. Select your workspace (e.g. *My workspace* or a shared one)
4. Click Publish — Desktop uploads the `.pbix` to the cloud

## Step 4 — Map the gateway in the Service

1. Power BI Service → your dataset → Settings → Gateway connection
2. Select the gateway and the data source configured in Step 2
3. Save

## Step 5 — Configure scheduled refresh

1. Dataset → Settings → Scheduled refresh → toggle **On**
2. Choose frequency: Daily / Weekly
3. Add time slots (e.g. 07:00 every morning)
4. Save — Power BI Service will refresh the dataset on schedule without Desktop being open

## Step 6 — Share the report

- **Workspace sharing**: add colleagues to the workspace (requires Pro or Premium)
- **Publish to web**: Report → File → Publish to web → generates a public embed link (no auth required — use only for non-sensitive data)
- **App**: bundle multiple reports into a Power BI App for cleaner distribution

## Checklist

| Step | Done |
|---|---|
| Gateway installed and registered | ☐ |
| PostgreSQL data source added to gateway | ☐ |
| Report published from Desktop | ☐ |
| Gateway mapped to dataset | ☐ |
| Scheduled refresh configured | ☐ |
| Report shared with stakeholders | ☐ |
