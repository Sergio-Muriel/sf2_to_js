class Sf2 < Thor

  require File.expand_path("./lib/sf2_to_js")

  desc 'to_js SF2_PATH', 'convert sf2 soundfont to javascript'
  method_option :output_dir, aliases: '-o', desc: "output directory", default: "./soundfonts/"
  method_option :instrument_ids, aliases: '-i', desc: "array of instrument ids to build instead of all", type: :array, default: []

  def to_js sf2_path
    options[:instrument_ids].map!(&:to_i)
    sf = Sf2ToJs.new sf2_path, options[:instrument_ids], options[:output_dir]
    sf.to_js
  end

end
