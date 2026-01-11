# 📝 Note Service (Next Generation)

> A modern rewrite of [note-service](https://github.com/deeheber/note-service) built with AWS CDK, TypeScript, and GraphQL

A sleek CRUD application for managing your notes in the cloud, featuring serverless architecture and GraphQL API powered by AWS AppSync.

## ✨ Features

- 🚀 **Serverless Architecture** - Built on AWS Lambda and DynamoDB
- 🔍 **GraphQL API** - Flexible queries and mutations via AWS AppSync
- 🛡️ **API Key Authentication** - Secure access to your notes
- 📦 **Infrastructure as Code** - Deployed with AWS CDK
- 🔧 **TypeScript** - Type-safe development experience

## 🚀 Getting Started

### 📋 Prerequisites

Before you begin, ensure you have the following set up:

1. **AWS Account** - [Sign up here](https://aws.amazon.com/console/) if you don't have one
2. **AWS CLI** - [Install and configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) on your machine
3. **CDK Bootstrap** - [Bootstrap your AWS environment](https://docs.aws.amazon.com/cdk/latest/guide/bootstrapping.html) for CDK deployments
4. **Node.js** - Install [Node.js](https://nodejs.org/en/) (version specified in `.nvmrc`)

### 🏃‍♂️ Quick Start

1. **Clone and Install**

   ```bash
   git clone <repository-url>
   cd note-service-next-generation
   npm install
   ```

2. **Deploy to AWS**

   ```bash
   npm run deploy
   ```

   > 💡 **First-time deployment tip**: If you encounter an error, run `npm run build` first

   **Using a custom AWS profile?**

   ```bash
   npm run build
   npm run cdk deploy -- --profile <your-profile-name>
   ```

3. **Get Your API Details**

   After deployment, note the `apiId` and `apiURL` from the console output - you'll need these for API requests!

4. **Start Making Requests**

   Use your favorite GraphQL client (Postman, GraphQL Playground, etc.) or the AWS AppSync console. [Here are some client suggestions](https://www.apollographql.com/blog/graphql/examples/4-simple-ways-to-call-a-graphql-api/) if you need one.

## 🔐 Authorization

This application uses **API Key authentication** for secure access.

### Getting Your API Key

**Option 1: AWS Console**

- Log into the AWS AppSync console after deployment
- Find your API key in the settings

**Option 2: AWS CLI**

```bash
aws appsync list-api-keys --api-id <your-api-id>
```

### Using Your API Key

Add this header to all your requests:

```
x-api-key: <your-api-key-value>
```

> ⚠️ **Important**: API keys expire after 30 days. You'll need to generate a new one when it expires.

## 📖 API Reference

### 🔍 Queries

#### List All Notes

```graphql
query ListNotes {
  listNotes {
    items {
      author
      content
      createdAt
      updatedAt
      id
    }
    total
  }
}
```

#### Get Note by ID

```graphql
query GetNote($id: ID = "Note id goes here") {
  getNote(id: $id) {
    author
    content
    createdAt
    id
    updatedAt
  }
}
```

### ✏️ Mutations

#### Create a New Note

```graphql
mutation CreateNote(
  $author: String = "Author goes here"
  $content: String = "Content goes here"
) {
  createNote(note: { author: $author, content: $content }) {
    author
    content
    createdAt
    id
    updatedAt
  }
}
```

#### Delete a Note

```graphql
mutation DeleteNote($id: ID = "ID to delete goes here") {
  deleteNote(id: $id)
}
```

#### Update a Note

```graphql
mutation UpdateNote($content: String = "add note content here") {
  updateNote(content: $content, id: "add note id here") {
    updatedAt
    id
    createdAt
    content
    author
  }
}
```

## 🧹 Clean Up

**Save money by removing resources when you're done:**

```bash
npm run destroy
```

Confirm the deletion when prompted. This removes the CloudFormation stack and all created AWS resources.

## 🛠️ Development Commands

| Command             | Description                                        |
| ------------------- | -------------------------------------------------- |
| `npm run build`     | Compile TypeScript to JavaScript                   |
| `npm run watch`     | Watch for changes and compile automatically        |
| `npm run deploy`    | Build and deploy to AWS via CDK                    |
| `npm install`       | Install dependencies (includes postinstall script) |
| `npm run test`      | Run Jest unit tests                                |
| `npm run cdk diff`  | Compare deployed stack with current state          |
| `npm run cdk synth` | Generate CloudFormation template                   |

> 💡 The `cdk.json` file tells the CDK Toolkit how to execute the app.

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details on how to get involved.
