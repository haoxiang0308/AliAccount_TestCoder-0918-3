#include "PlayerInputHandler.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Set up gameplay key bindings
	check(InputComponent);

	// Movement
	InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
	
	// Look
	InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
	InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
	
	// Action
	InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
}

void APlayerInputHandler::MoveForward(float Value)
{
	ForwardInputValue = Value;
	// Add movement logic here
}

void APlayerInputHandler::MoveRight(float Value)
{
	RightInputValue = Value;
	// Add movement logic here
}

void APlayerInputHandler::LookUp(float Value)
{
	// Add look up/down logic here
	AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
	// Add turn logic here
	AddControllerYawInput(Value);
}

void APlayerInputHandler::Jump()
{
	// Add jump logic here
}