FROM payara/micro:5.2022.5
COPY dist/PPETradingClearance.war $DEPLOY_DIR
CMD ["java", "-Xmx256m", "-jar", "payara-micro.jar", "--deploy", "/opt/payara/deployments/PPETradingClearance.war"]

