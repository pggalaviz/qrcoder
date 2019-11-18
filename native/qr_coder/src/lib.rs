#[macro_use] extern crate rustler;
// #[macro_use] extern crate rustler_codegen;
#[macro_use] extern crate lazy_static;

extern crate qrcode;

use qrcode::render::svg;
use qrcode::QrCode;

use rustler::{Env, Term, NifResult, Encoder};

mod atoms {
    rustler_atoms! {
        atom ok;
    }
}

rustler_export_nifs! {
    "Elixir.QRCoder",
    [
        ("nif_generate_svg", 2, nif_generate_svg)
    ],
    None
}

fn nif_generate_svg<'a>(env: Env<'a>, args: &[Term<'a>]) -> NifResult<Term<'a>> {
    let data: &str = try!(args[0].decode());
    let color: &str = try!(args[1].decode());

    let code = QrCode::new(data.as_bytes()).unwrap();

    let image = code.render()
        .min_dimensions(300, 300)
        .dark_color(svg::Color(color))
        .light_color(svg::Color("#ffffff"))
        .build();

    Ok((atoms::ok(), image).encode(env))
}
