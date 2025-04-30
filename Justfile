width := "3"
depth := "3"
height := "5"
dimensions := width + "x" + depth + "x" + height
format := "stl"
openscad := "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"

install:
    if [ ! -d "gridfinity_extended_openscad" ]; then \
        git clone --depth 1 git@github.com:ostat/gridfinity_extended_openscad.git; \
    fi

example: && _success
    {{ openscad }} -o "examples/{{ dimensions }} example.{{ format }}" \
      gridfinity_extended_openscad/gridfinity_basic_cup.scad \
      -D 'render_choice="cup"' \
      -D 'sliding_lid_enabled=false' \
      -D "width={{ width }}" \
      -D "depth={{ depth }}" \
      -D "height={{ height }}" \
      -D 'wallpattern_enabled=true' \
      -D 'wall_thickness=1.2' \
      -D 'floor_thickness=1.2' \
      -D 'text_1=true' \
      --enable=textmetrics

tall: && _success
    {{ openscad }} -o "tall/{{ dimensions }} tall.{{ format }}" \
      gridfinity_extended_openscad/gridfinity_basic_cup.scad \
      -D 'render_choice="cup"' \
      -D 'sliding_lid_enabled=false' \
      -D "width={{ width }}" \
      -D "depth={{ depth }}" \
      -D "height={{ height }}" \
      -D 'enable_magnets=false' \
      -D 'enable_screws=false' \
      -D 'efficient_floor=true' \
      -D 'wallpattern_enabled=true' \
      -D 'finger_slide="all"' \
      -D 'wall_thickness=1.2' \
      -D 'floor_thickness=1.2' \
      -D 'label_style="disabled"' \
      # -D 'fingerslide="rounded"' \
      # -D 'fingerslide_walls=[1,1,1,1]' \
      -D 'text_1=true' \
      --enable=textmetrics

anylid:
    {{ openscad }} -o "anylid/{{ dimensions }} anylid.{{ format }}" \
      anylid.scad \
      -D "Width_Units={{ width }}" \
      -D "Length_Units={{ depth }}"

@_success:
    say "open scad finished {{ dimensions }}"
