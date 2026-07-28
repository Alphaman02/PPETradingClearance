FROM payara/server-full:latest
COPY dist/PPETradingClearance.war $DEPLOY_DIR
