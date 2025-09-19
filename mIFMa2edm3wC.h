// mIFMa2edm3wC.h
// Player input handler class for Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "mIFMa2edm3wC.generated.h"

/**
 * Custom player controller class that handles player input
 */
UCLASS()
class MYGAME_API AmIFMa2edm3wC : public APlayerController
{
	GENERATED_BODY()

public:
	// Constructor
	AmIFMa2edm3wC();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupInputComponent() override;

private:
	// Input functions
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