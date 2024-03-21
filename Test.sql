CREATE TABLE "CrowdfundingSchema"."Campaign" (
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
    "category" VARCHAR(100) NOT NULL,
    "subcategory" VARCHAR(100) NOT NULL,
    "category_name" VARCHAR(100) NOT NULL,
    "subcategory_name" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY ("cf_id")
);

CREATE TABLE "CrowdfundingSchema"."Category" (
    "category_id" INT NOT NULL,
    "category_name" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY ("category_id"),
    CONSTRAINT "uq_Category_category_name" UNIQUE ("category_name")
);

CREATE TABLE "CrowdfundingSchema"."Contacts" (
    "contact_id" INT NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY ("contact_id")
);

CREATE TABLE "CrowdfundingSchema"."Subcategories" (
    "subcategory_id" INT NOT NULL,
    "subcategory_name" VARCHAR(255) NOT NULL,
    CONSTRAINT "pk_Subcategories" PRIMARY KEY ("subcategory_id"),
    CONSTRAINT "uq_Subcategories_subcategory_name" UNIQUE ("subcategory_name")
);

ALTER TABLE "CrowdfundingSchema"."Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "CrowdfundingSchema"."Contacts" ("contact_id");

ALTER TABLE "CrowdfundingSchema"."Campaign" ADD CONSTRAINT "fk_Campaign_category_name" FOREIGN KEY("category_name")
REFERENCES "CrowdfundingSchema"."Category" ("category_name");

ALTER TABLE "CrowdfundingSchema"."Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_name" FOREIGN KEY("subcategory_name")
REFERENCES "CrowdfundingSchema"."Subcategories" ("subcategory_name");
