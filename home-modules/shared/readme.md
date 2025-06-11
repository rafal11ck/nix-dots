# Home manager coniguration 

It's based on HM's attribute set paths so for easier maitnainace.

## Explanation

Setting for `services.foo` should be in `services.nix` file unless there is any setting in `services` that warrants for it's own file. 
In case that extra file is neeed `services.nix` is transforemd into `services` directory and `services.nix` file content migrated into `services/default.nix` 
Settings that are too big are moved out of `services/default.nix` into their own files (eg. `services/foo.nix`) and included by `services/default.nix` 

In pratice this will look like this in directory structure.
```sh
./services.nix # contains services attribute set
```
After adding service to `services.foo` that warrants it's own file will be transformed into
```sh
./services # base directory of services attribute set
./services/default.nix # has what services.nix would have and `imports` extracted services
./services/foo.nix # contains services.foo
```

# Modules

Modules are for use cases where regural layout would be inpratcial, that is it would scatter confgis all over place. Modules group configuration by responsibility.
Basicly normal layout is by attriube path, module layout is is by resposibility.
Modules can follow regural layout in inside.