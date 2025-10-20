#include "PlayerInputHandler.h"
#include "Engine/Engine.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this pawn to call Tick() every frame
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Initialization code here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.5f, FColor::Green, TEXT("Player Input Handler Initialized"));
	}
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

	// Add any per-frame logic here
}

void APlayerInputHandler::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Ensure InputComponent is valid
	if (InputComponent)
	{
		// Bind axis mappings
		InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
		InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
		InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
		InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

		// Bind action mappings
		InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
		InputComponent->BindAction("Shoot", IE_Pressed, this, &APlayerInputHandler::Shoot);
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Add forward movement logic here
		MoveForwardValue = Value;
		AddMovementInput(GetActorForwardVector(), Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Add right movement logic here
		MoveRightValue = Value;
		AddMovementInput(GetActorRightVector(), Value);
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		// Add look up/down logic here
		AddControllerPitchInput(Value);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		// Add turn logic here
		AddControllerYawInput(Value);
	}
}

void APlayerInputHandler::Jump()
{
	// Add jump logic here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Yellow, TEXT("Jump pressed!"));
	}
}

void APlayerInputHandler::Shoot()
{
	// Add shooting logic here
	if (GEngine)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Red, TEXT("Shoot pressed!"));
	}
}