-- Drop table

-- DROP TABLE public.cpu_usage;

CREATE TABLE public.cpu_usage (
	id serial4 NOT NULL,
	"usage" float8 NOT NULL,
	"date" date NULL,
	"time" time NULL,
	use bool NULL DEFAULT true,
	CONSTRAINT cpu_usage_pkey PRIMARY KEY (id)
);

