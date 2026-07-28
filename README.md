
# Why Are We Losing Good People? An HR Attrition Analysis

Every year, companies watch talented employees walk out the door — and often don't fully understand why until exit interviews are already over. This project started with a simple question: **can the data tell us who's at risk of leaving before they actually do?**

Using IBM's HR Analytics dataset (1,470 employees, 35 attributes), I worked through this problem the way a BI analyst would on the job — starting in SQL to interrogate the data, then building a Power BI dashboard to turn the findings into something a decision-maker could actually act on.

## The Business Problem

Employee attrition isn't just an HR metric — it's a cost center. Replacing an employee typically costs 50–200% of their annual salary once you factor in recruiting, onboarding, and lost productivity. With attrition sitting at **16.1%** in this dataset, that's a meaningful chunk of the workforce walking out the door every year.

The goal of this project wasn't to just report *how many* people left — it was to answer three questions leadership actually cares about:

1. **Where** is attrition concentrated? (which departments, roles, teams)
2. **Why** are people leaving — is it pay, overtime, satisfaction, stalled careers?
3. **Who** on the current team is at risk *right now*, so HR can intervene before it's too late?

## What I Found

A few things stood out once I got past the surface-level numbers:

- **Overtime is the single strongest driver of attrition.** Employees working overtime leave at nearly **3x the rate** of those who don't (30.5% vs 10.4%). This isn't subtle — it's the loudest signal in the whole dataset.
- **Sales Representatives have the highest attrition of any role**, at almost **40%** — compared to under 5% for Managers and Research Directors. Seniority and stability seem to matter more than department alone.
- Attrition is highest in **Sales (20.6%)** and **HR (19%)**, and lowest in **R&D (13.8%)** — worth digging into whether this is about role pressure, career pathing, or something else entirely.
- Lower job satisfaction, lower work-life balance scores, and shorter tenure all correlate with higher attrition — but overtime and role still explain more of the variance than satisfaction scores alone.

## Recommendations

Based on the analysis, here's what I'd actually bring to a stakeholder meeting:

1. **Audit overtime policy in Sales and HR first.** The overtime-attrition link is too strong to ignore, and it's also the most directly fixable lever — unlike compensation or career structure, this is an operational decision that could be changed within a quarter.
2. **Build a retention plan specifically for Sales Representatives.** With attrition near 40%, this role needs its own intervention — better onboarding, clearer commission/growth structure, or manager support — rather than a company-wide policy.
3. **Use tenure as an early-warning signal.** Attrition risk isn't flat across a career — flagging employees in their first 1–2 years for extra check-ins could catch people before they disengage.
4. **Don't treat satisfaction scores in isolation.** They matter, but overtime and role turned out to be stronger predictors — a good reminder that HR surveys alone won't catch everything.

## What's in This Repo

- **`/sql`** — Queries used to explore the dataset: attrition rates by department/role, overtime cross-tabs, income and tenure breakdowns, and the groundwork for the dashboard's DAX measures.
- **`/dashboard`** — Power BI file (`.pbix`) with the full interactive dashboard: KPI overview, department/role breakdown, overtime and satisfaction drivers, and filterable slicers.
- **`/screenshots`** — Static images of the dashboard for anyone browsing without Power BI installed.
- **`HR_dataset.csv`** — The raw dataset (IBM HR Analytics Employee Attrition & Performance, publicly available on Kaggle).

## The Dashboard

The dashboard is built around one page, on purpose — the goal was to make the story readable in under a minute:

- **Top row:** headline KPIs (total employees, attrition rate, avg income, avg tenure)
- **Middle:** where attrition is concentrated (department/role) and its single biggest driver (overtime)
- **Bottom:** deeper drivers — income bands, satisfaction comparisons between leavers and stayers — plus slicers so you can filter by department, gender, or overtime status and watch the story shift.

## Tools Used

- **SQL** — data exploration, aggregation, and validation before visualization
- **Power BI** — DAX measures, interactive dashboard, drill-down filtering
- **Dataset:** IBM HR Analytics Employee Attrition & Performance (Kaggle)

## A Note on the Data

This is a well-known, somewhat idealized dataset — real HR data is messier and attrition drivers vary a lot by industry and geography. I've treated the findings here as illustrative of the *analysis process*, not as universal truths about why people quit jobs. The methodology — going from a business question, to SQL exploration, to a dashboard that supports a decision — is the actual point of this project.

## Let's Connect

If you have feedback on the analysis, the dashboard design, or just want to talk data — feel free to open an issue or reach out. Always happy to hear how others would've approached this differently.
