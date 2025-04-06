module.exports = {
    projectConfig: {
      redis_url: process.env.REDIS_URL || "",
      database_url: process.env.DATABASE_URL,
      database_type: "postgres",
      jwt_secret: process.env.JWT_SECRET || "your-secret",
      cookie_secret: process.env.COOKIE_SECRET || "cookie-secret",
    },
    plugins: [],
  };
  