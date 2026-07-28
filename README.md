# PPE Trading Clearance

A Java EE web application designed to support traders with a structured **PPE Trading Checklist**.  
This tool helps ensure physical, mental, and emotional readiness before engaging in trading activities.

---

## ✅ PPE Trading Checklist

### Physical Well-being
- Did I get 7–8 hours of sleep?
- Did I eat a nutritious breakfast?
- Am I hydrated (drunk enough water)?
- Did I exercise or stretch today?
- Am I feeling energized and alert?

### Mental Clarity
- Am I feeling calm and focused?
- Did I meditate or practice mindfulness?
- Am I free from distractions (family, social media)?
- Did I review my trading plan and goals?

### Emotional State
- Am I feeling patient and disciplined?
- Am I managing my emotions (greed, fear)?
- Did I reflect on my previous trades (lesson learned)?
- Am I feeling confident in my trading abilities?

### Trading Readiness
- Did I analyze the markets and identify potential trades?
- Do I have a clear trading strategy for the day?
- Are my trading platforms and tools functioning properly?
- Do I have sufficient funds in my trading account?

---

## 📊 Scoring System

- **Physical Well-being (30 points)**  
- **Mental Clarity (25 points)**  
- **Emotional State (20 points)**  
- **Trading Readiness (25 points)**  

**Interpretation:**
- 90–100: Ready to trade!  
- 80–89: Close — review checklist and adjust.  
- 70–79: Caution — reconsider trading today.  
- Below 70: Do not trade — focus on self-care.

---

## 🚀 Running the Project

### Local Deployment
1. Build the WAR in NetBeans.  
2. Run with Payara Micro:
   ```bash
   java -jar payara-micro.jar --deploy dist/PPETradingClearance.war
