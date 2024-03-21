CREATE TABLE "Contacts" (
    "contact_id" INT NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY ("contact_id")
);

CREATE TABLE "Category" (
    "category_id" INT NOT NULL,
    "category_name" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY ("category_id"),
    CONSTRAINT "uq_Category_category_name" UNIQUE ("category_name")
);

CREATE TABLE "Subcategories" (
    "subcategory_id" INT NOT NULL,
    "subcategory_name" VARCHAR(255) NOT NULL,
    CONSTRAINT "pk_Subcategories" PRIMARY KEY ("subcategory_id"),
    CONSTRAINT "uq_Subcategories_subcategory_name" UNIQUE ("subcategory_name")
);

CREATE TABLE "Campaign" (
    "cf_id" INT NOT NULL,
    "contact_id" INT NOT NULL,
    "company_name" VARCHAR(255) NOT NULL,
    "blurb" TEXT NOT NULL,
    "goal" DECIMAL(15) NOT NULL,
    "pledged" DECIMAL(15) NOT NULL,
    "outcome" VARCHAR(50) NOT NULL,
    "backers_count" INT NOT NULL,
    "country" VARCHAR(50) NOT NULL,
    "currency" VARCHAR(10) NOT NULL,
    "launch_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "staff_pick" BOOLEAN NOT NULL,
    "spotlight" BOOLEAN NOT NULL,
    "category_subcategory" VARCHAR(255) NOT NULL,
    "category" VARCHAR(100),
    "subcategory" VARCHAR(100),
    "category_name" VARCHAR(100),
    "subcategory_name" VARCHAR(100),
    CONSTRAINT "pk_Campaign" PRIMARY KEY ("cf_id"),
    CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY ("contact_id") REFERENCES "Contacts" ("contact_id") ON DELETE CASCADE,
    CONSTRAINT "fk_Campaign_category_name" FOREIGN KEY ("category_name") REFERENCES "Category" ("category_name") ON DELETE SET NULL,
    CONSTRAINT "fk_Campaign_subcategory_name" FOREIGN KEY ("subcategory_name") REFERENCES "Subcategories" ("subcategory_name") ON DELETE SET NULL
);
