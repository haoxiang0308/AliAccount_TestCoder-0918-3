// PlayerInputHandler_WperM1qDDS.cpp
#include "PlayerInputHandler.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/Controller.h"

APlayerInputHandler::APlayerInputHandler()
{
	// Set this controller to call Tick() every frame
	PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
}

void APlayerInputHandler::SetupInputComponent()
{
	// Set up gameplay key bindings
	Super::SetupInputComponent();

	InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
	InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
	InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);

	InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
	InputComponent->BindAction("Jump", IE_Released, this, &APlayerInputHandler::StopJumping);
}

void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

void APlayerInputHandler::MoveForward(float Value)
{
	if ((GetPawn() != nullptr) && (Value != 0.0f))
	{
		// Find out which way is forward
		const FRotator Rotation = GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get forward vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		GetPawn()->AddMovementInput(Direction, Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if ((GetPawn() != nullptr) && (Value != 0.0f))
	{
		// Find out which way is right
		const FRotator Rotation = GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get right vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
		GetPawn()->AddMovementInput(Direction, Value);
	}
}

void APlayerInputHandler::Turn(float Rate)
{
	// Calculate delta for this frame from the rate information
	AddControllerYawInput(Rate * GetWorld()->GetDeltaSeconds() * 50.0f);
}

void APlayerInputHandler::LookUp(float Rate)
{
	// Calculate delta for this frame from the rate information
	AddControllerPitchInput(Rate * GetWorld()->GetDeltaSeconds() * 50.0f);
}

void APlayerInputHandler::Jump()
{
	if (GetPawn() != nullptr)
	{
		GetPawn()->Jump();
	}
}

void APlayerInputHandler::StopJumping()
{
	if (GetPawn() != nullptr)
	{
		GetPawn()->StopJumping();
	}
}