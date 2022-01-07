# Introduction

![example workflow](https://github.com/RamSailopal/YottaDB-FileMan/actions/workflows/deploy.yml/badge.svg)

FileMan is YottaDB management utility developed as part of the Vista Project

This repo allows the provision of a development environment through docker that gives you everything that you need to develop with Rust, YottaDB and FileMan

# sandbox

The sandbox environment is an immutable environment with no persistent code base or database. To provision:

      git clone https://github.com/RamSailopal/YottaDB-Rust.git
      cd YottaDB-Rust/sandbox
      docker-compose up
      
# dev

The dev environment differs from sandbox in that the code base and database is persistent. To provision:
  
First clone the YDBRust repo

      git clone https://gitlab.com/YottaDB/Lang/YDBRust.git

Then clone this repo

      git clone https://github.com/RamSailopal/YottaDB-Rust.git

Set the persistent YottaDB and Rust paths

      export yottadatadir="/path/to/YottaDB"
      export rustcode="/path/to/YDBRust"

Provision the stack:

     cd YottaDB-Rust/dev
     docker-compose up

# Beginning development

Navigate to http://ipofdockerserver:3002/#/home/yottadb-settings/Yottadb.theia-workspace

Open a compilation window:

   **Terminal** -> **Run Task** -> **YottaDB Compiler** -> **Continue without scanning the task output**

Open the **say_hello_rust** example:

   **File** -> **Open** -> **examples** -> **say_hello_rust.rs**

This example sets the global entry **^hello("Rust")** to こんにちは.

Change the こんにちは entries to something else i.e. "Yotta"

Save the file

The compilation window should then show the compilation and execution of the code (note the first execution takes time as the dependancies will need to be built)

Once **Running `target/debug/examples/say_hello_rust`** has appeared in the compilation window the code has compiled and run

Open a YottaDB environment window:

    **Terminal** -> **Run Task** -> **YDB** -> **Continue without scanning the task output**
    
In the new window, enter:

    D ^%G
    
    Output device: <terminal>:
    
    List ^hello
    
    ^hello("Rust")="Yotta"
    
The **^hello("Rust")** global/subscript entry should now display as **Yotta** as above.


# Building a project

Create a main.rs file in the src folder:


     **File** -> **Open** -> **src**
     
     **File** -> **New File**
     
Add the example Hello World Code:

     fn main() {
        println!("Hello, world!");
     }
     
Save the file

Run the Rust compiler:

    **Terminal** -> **Run Task** -> **Rust Compiler** -> **Continue without scanning the task output**
    
Run the Rust code:

    **Terminal** -> **Run Task** -> **Rust Run** -> **Continue without scanning the task output**
    
**Hello, world!** should appear at the bottom of the Rust Run window

# Using FileMan

    **Terminal** -> **Run Task** -> **FileMan** -> **Continue without scanning the task output**
    
 Documentation relating to FileMan is available in the docs directory:
    
 https://github.com/RamSailopal/YottaDB-FileMan/blob/main/docs/Fileman_22-2_Getting_Started.pdf



# SSH Keys

This repo contains ssh keys for demonstation/sandpit purposes only. For a production environment, please set up new, none source controlled keys.


