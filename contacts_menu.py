import click

@click.command()
def contact_menu():
    """Contact Menu"""
    while True:
        click.echo("1. Create a new contact")
        click.echo("2. Search by any field")
        click.echo("3. Help")
        click.echo("4. Quit")
        click.echo("Enter the option: ")
        choice = click.getchar()

        if choice == "1":
            create_contact()
        elif choice == "2":
            search_menu()
        elif choice == "3":
            help_menu()
        elif choice == "4":
            click.echo("Bye!")
            exit(0)
        else:
            click.echo("Wrong option")

@click.command()
def create_contact():
    """Create a new Contact"""
    name = click.prompt("Enter name: ")
    email = click.prompt("Enter email: ")
    phone = click.prompt("Enter phone: ")

    with open("contacts.txt", "a") as f:
        f.write(f"{name}, {email}, {phone}\n")

    click.echo("Great! the contact has been created!")

@click.command()
def search_menu():
    """Search contacts"""
    search_term = click.prompt("Enter a search term: ")

    with open("contacts.txt", "r") as f:
        for line in f:
            if search_term in line:
                click.echo(line)


@click.command()
def help_menu():
    """Help Menu"""
    click.echo("Press 1 to create a new contact")
    click.echo("Press 2 to search for a contact")
    click.echo("Press 3 to display this help menu")
    click.echo("Press 4 to quit")
    click.echo("Press enter to continue")

if __name__ == "__main__":
    contact_menu()
