# Diamond Hacks iOS + GraphQL Demo

### GraphQL Implementation Steps

#### 1. Make Hasura droplet on Digital Ocean
#### 2. Modify the database at http://hasura_ip_address/console
#### 3. Download gq command line interface tool
#### 4. Download the schema with the following:
gq http://hasura_ip_address/v1alpha1/graphql --introspect --format json > schema.json

### iOS Implementation Steps
#### 1. Add 'Apollo' to your podfile
#### 2. Inside the application targert, create a new Build Phase script with the following: 
APOLLO_FRAMEWORK_PATH="$(eval find $FRAMEWORK_SEARCH_PATHS -name "Apollo.framework" -maxdepth 1)"

if [ -z "$APOLLO_FRAMEWORK_PATH" ]; then
echo "error: Couldn't find Apollo.framework in FRAMEWORK_SEARCH_PATHS; make sure to add the framework to your project."
exit 1
fi

cd "${SRCROOT}/${TARGET_NAME}"
$APOLLO_FRAMEWORK_PATH/check-and-run-apollo-cli.sh codegen:generate --queries="$(find . -name '*.graphql')" --schema=schema.json API.swift
#### 3. Add the following code as global variables in AppDelegate.swift
import Apollo
let graphEndpoint = "http://hasura_ip_address/v1alpha1/graphql"
let apollo = ApolloClient(url: URL(string: graphEndpoint)!)
#### 4. Add the schema.json file to your app directory
#### 5. Create a file with the .graphql extension to hold queries, mutations, and subscriptions
#### 6. Build the project, then add the generated API.swift file to your app directory
