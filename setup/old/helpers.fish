




function add-ppa
for ppa in $argv
sudo add-apt-repository -y "ppa:$ppa"
end

sudo apt-get update
end
  

function apt-install
for package in $argv
sudo apt-get install -y $package
end
end


function batch-install
for input in $argv
      if  (string match "ppa:*" $input)
      set ppa $ppa (string replace ppa: " " $input)
      else
      set packages $packages $input
    end
    end
add-ppa $ppa
apt-install $packages


end



