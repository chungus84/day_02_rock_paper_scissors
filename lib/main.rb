# A, X = 'Rock' 1
# B, Y = 'Paper' 2
# C, Z = 'Scissors' 3


$score_part1 = 0
$score_part2 = 0

OPP_CONDITIONS = {
  'A' =>"Rock",
  'B' => "Paper",
  'C' => "Scissors"
}

CONDITIONS = {
  'X' =>"Rock",
  'Y' => "Paper",
  'Z' => "Scissors"
}

POINTS_PER_SHAPE = {
  'Rock' => 1,
  'Paper' => 2,
  'Scissors' => 3
}

WINNING_COND = {
  'Rock' => 'Scissors',
  'Paper' => 'Rock',
  'Scissors' => 'Paper'
}

LOSE_COND = {
  'Rock'=> ['Paper', 2],
  'Paper' => ['Scissors', 3],
  'Scissors' => ['Rock', 1]
}

file = File.readlines('data/data.txt')

def winner(opp_choice, your_choice)
  if CONDITIONS[your_choice] == OPP_CONDITIONS[opp_choice]
    $score_part1 += POINTS_PER_SHAPE[CONDITIONS[your_choice]] + 3
  elsif WINNING_COND[CONDITIONS[your_choice]] == OPP_CONDITIONS[opp_choice]
    $score_part1 += POINTS_PER_SHAPE[CONDITIONS[your_choice]] + 6
  elsif WINNING_COND[OPP_CONDITIONS[opp_choice]] == CONDITIONS[your_choice]
    $score_part1 += POINTS_PER_SHAPE[CONDITIONS[your_choice]]
  end
end

def winner_part2(opp_choice, your_choice)
  if your_choice == 'X'
    $score_part2 += POINTS_PER_SHAPE[WINNING_COND[OPP_CONDITIONS[opp_choice]]]
  elsif your_choice == 'Y'
    $score_part2 += POINTS_PER_SHAPE[OPP_CONDITIONS[opp_choice]] + 3
  elsif your_choice == 'Z'
    $score_part2 += LOSE_COND[OPP_CONDITIONS[opp_choice]][1] + 6
  end
end

# For part 1
file.each do |ele|
  winner(ele[0], ele[2])
end

puts $score_part1

# For Part 2

file.each do |ele|
  winner_part2(ele[0], ele[2])
end

puts $score_part2
