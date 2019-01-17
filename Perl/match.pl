my $filename = 'input.txt';
my $vowels = 0;
my @chars;

open(my $fh, '<:encoding(UTF-8)', $filename)
	or die "Could not open file $filename !";

while (my $row = <$fh>)
{
	$vowels = 0;
	chomp $row;
	@chars = split(//,$row);
	for($i=0;$i<@chars;$i++)
	{
		if($chars[$i]=~/a/) {$vowels++;}
		if($chars[$i]=~/e/) {$vowels++;}
		if($chars[$i]=~/i/) {$vowels++;}
		if($chars[$i]=~/o/) {$vowels++;}
		if($chars[$i]=~/u/) {$vowels++;}
	}
	if($row=~/or/)
		{print "$row contains or\n";}
	if($vowels>1)
		{print "$row contains at least two vowel letters\n";}
	if($row!~/^h/)
		{print "$row does not start with h\n";}
	if($chars[1]=~/e/ && $chars[@chars-1]=~/y/)
		{print "$row has e as the second symbol and ends with y\n";}
	if($row=~/[a-z]/ && $row=~/[0-9]/)
		{print "$row contains both letters and digits\n";}
	splice(@chars);
}