/*
* Copyright 2020 Your Organization (https://yourwebsite.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Author <author@example.com>
*/

public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.yourusername.yourrepositoryname",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var switch = new Gtk.Switch () {
            halign = Gtk.Align.CENTER,
            valign = Gtk.Align.CENTER
        };

        var main_window = new Gtk.ApplicationWindow (this) {
            default_height = 300,
            default_width = 300
        };
        main_window.add (switch);
        main_window.show_all ();

        var settings = new GLib.Settings ("com.github.yourusername.yourrepositoryname");
        settings.bind ("useless-setting", switch, "active", GLib.SettingsBindFlags.DEFAULT);
    }

    public static int main (string[] args) {
        return new MyApp ().run (args);
    }
}
