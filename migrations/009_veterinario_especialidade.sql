create table public.veterinario_especialidade (
  id_veterinario integer not null,
  id_especialidade integer not null,
  constraint pk_veterinario_especialidade primary key (id_veterinario, id_especialidade),
  constraint fk_ve_especialidade foreign KEY (id_especialidade) references especialidade (id_especialidade),
  constraint fk_ve_veterinario foreign KEY (id_veterinario) references veterinario (id_veterinario)
) TABLESPACE pg_default;