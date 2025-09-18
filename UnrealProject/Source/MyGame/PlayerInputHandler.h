// PlayerInputHandler.h
#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * Custom player controller class that handles enhanced input
 */
UCLASS()
class MYGAME_API APlayerInputHandler : public APlayerController
{
	GENERATED_BODY()

public:
	// Constructor
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

	// Called to set up input bindings
	virtual void SetupInputComponent() override;

private:
	// Input action handlers
	UFUNCTION()
	void MoveForward(float Value);

	UFUNCTION()
	void MoveRight(float Value);

	UFUNCTION()
	void Turn(float Value);

	UFUNCTION()
	void LookUp(float Value);

	UFUNCTION()
	void Jump();

	UFUNCTION()
	void StopJumping();
};