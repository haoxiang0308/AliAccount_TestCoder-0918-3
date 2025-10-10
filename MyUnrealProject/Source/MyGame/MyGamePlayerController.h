#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "MyGamePlayerController.generated.h"

UCLASS()
class MYGAME_API AMyGamePlayerController : public APlayerController
{
	GENERATED_BODY()

public:
	AMyGamePlayerController();

protected:
	virtual void SetupInputComponent() override;

public:
	// Example input functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void LookUp(float Value);
	void Turn(float Value);

	// Example input actions
	void Jump();
	void Fire();

private:
	// Input component references (not actual UPROPERTY)
	// UInputComponent* InputComponent;
};