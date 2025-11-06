# Driver–Demand Equilibrium (D²E) Framework

**Live Notebook:** [Open in Colab](https://colab.research.google.com/drive/10YltDFyn-0P63axEg41RCWDTDCEPCR0L?authuser=0#scrollTo=7699d36d)

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/10YltDFyn-0P63axEg41RCWDTDCEPCR0L?authuser=0#scrollTo=7699d36d)

This repository contains a reproducible, beginner-friendly setup for analyzing supply–demand balance in last-mile logistics using the **D²E** framework.

## ✨ What’s Inside
- `d2e_hourly_driver_demand.csv` — sample hourly dataset across 5 regions
- `regions_lookup.csv` — region → category mapping (Urban Core, Suburban, Regional)
- `sample_incentives.csv` — example surge multipliers by region-hour
- `D2E_driver_demand.ipynb` — your Colab notebook (upload from File → Download .ipynb)
- *(Optional)* `mysql_schema_d2e.sql` and `mysql_queries_d2e.sql` — starter SQL

## 📊 Key Metrics
- **DFR (Demand Fulfillment Ratio)** = `completed_deliveries / total_requests`
- **DUR (Driver Utilization Rate)** = `active_delivery_time_minutes / logged_in_time_minutes`
- **SLI (Service Latency Index)** = `actual_eta_minutes / promised_eta_minutes`
- **DDES (Composite Score)** = weighted combination of DFR, DUR, and inverse SLI

## ▶️ How to Run (Colab)
1. Open the notebook with the Colab badge above.
2. Upload the CSVs (left pane → Files → Upload) or mount Google Drive.
3. Run the cells to generate:
   - DFR heatmaps by hour-region
   - DDES by region
   - DFR vs. SLI scatter analysis

## 🧱 Folder Structure (suggested)
```
D2E_Driver_Demand_Framework/
├── D2E_driver_demand.ipynb
├── d2e_hourly_driver_demand.csv
├── regions_lookup.csv
├── sample_incentives.csv
├── mysql_schema_d2e.sql           # optional
└── mysql_queries_d2e.sql          # optional
```

## 🧪 Reproducibility Notes
- Seeded randomization is used in the sample CSV to mimic realistic peaks (morning/evening in urban).
- Replace sample CSVs with your real data when available.
- Adjust incentive multipliers per zone-hour for scenario testing.

## 📄 License
MIT (or your preferred license)
