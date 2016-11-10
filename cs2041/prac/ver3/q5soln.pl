#!/usr/bin/perl -w

while (1) {
    print "Enter student name: ";
    $name = <STDIN>;
    last if !defined $name;
    chomp $name;
    print "Enter library fine: ";
    $fine = <STDIN> ;
    $total_fine{$name} += $fine;
}

$largest_fine = -1;
$student_to_expel = "";
foreach $student (keys %total_fine) {
    if ($total_fine{$student} > $largest_fine) {
        $largest_fine = $total_fine{$student};
        $student_to_expel = $student;
    }
}
print "Expel $student_to_expel whose library fines total \$$largest_fine\n";
