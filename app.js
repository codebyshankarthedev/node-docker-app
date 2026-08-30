const express = require("express");
const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
    res.send("Hello! Node.js application is running.");
});

app.get("/health", (req, res) => {
    res.json({
        status: "OK",
        message: "Application is healthy"
    });
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is running on port ${PORT}`);
});
// Triggering SonarQube PR scan
