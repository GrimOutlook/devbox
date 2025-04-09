#!/usr/bin/env fish

function read_confirm
  argparse d/default= -- $argv

  switch $_flag_d
    case Y y
      set yes "Y"
      set no "n"
    case N n
      set yes "y"
      set no "N"
    case "*"
      echo "Unknown default for read_confirm [$_flag_d]" >&2
      return 1
  end

  set prompt $argv

  while true
    read -l -P "$prompt [$yes/$no]: " confirm
    switch $confirm
      case Y y
        return 0
      case N n
        return 1
      case ''
        switch $_flag_d
          case Y y
            return 0
          case N n
            return 1
        end
    end
  end
end