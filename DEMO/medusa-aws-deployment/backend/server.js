const express = require("express");
const { Medusa } = require("@medusajs/medusa");

const app = express();
const PORT = 9000;

Medusa.create()
  .then((container) => {
    app.use("/admin", express.static("admin"));
    app.use("/", container.resolve("app"));

    app.listen(PORT, () => {
      console.log(`Medusa backend is running on port ${PORT}`);
    });
  })
  .catch(console.error);
