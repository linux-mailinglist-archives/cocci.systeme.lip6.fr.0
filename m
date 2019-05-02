Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 525ED123D0
	for <lists+cocci@lfdr.de>; Thu,  2 May 2019 23:05:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
          by isis.lip6.fr (8.15.2/lip6) with ESMTP id x42L4INS009507
          ; Thu, 2 May 2019 23:04:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7DB977752;
	Thu,  2 May 2019 23:04:18 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B751A7736
 for <cocci@systeme.lip6.fr>; Thu,  2 May 2019 23:04:16 +0200 (CEST)
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.40])
 by isis.lip6.fr (8.15.2/lip6) with ESMTP id x42L4FTv015363
 for <cocci@systeme.lip6.fr>; Thu, 2 May 2019 23:04:16 +0200 (CEST)
X-pt: isis.lip6.fr
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 7BB666C7
 for <cocci@systeme.lip6.fr>; Thu,  2 May 2019 23:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mykolab.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:mime-version:date:date:message-id:subject:subject
 :from:from:received:received:received; s=dkim20160331; t=
 1556831054; x=1558645455; bh=S7y86Ld02c8D9grOQ7RSZZitZT4tNcvZLel
 9rjBgMD8=; b=2k1TmdCljasu94O+H1A6MvXIVD0w3XUVE11g035+BJjMsbXDgkc
 DE6ow6E1LQ+iSdCjn+b7OqufbyEPZTGZZNTlS/ufU5WZKe5BAjkEgnj+/bj2L5Jd
 HSJOzSpYJTUBhfv+oOjFwVlBIrYDE7oCtPxO/ZRAU3RYV1m7S6LChoqo9kT+dkRx
 LNS5lcLDrtgNsxZK8ZOAU0/pAfiG7woz0B8pnEm4WB3m6dYW42SNzALzyMJCubFK
 EuTaEkz5epEBwyzQud5RzoOuXEnQqgyaW0JF9/qwKOkIgS6AE7MhahP5C/FZafmV
 +QoEe24V7vRlk+KQqpUozoy2ZttmnIz65jWe+A3SZ7RNGQ8VzC9abf74KHQIXTF9
 x4h6yPaISQ4dW8OY6ZQL1i0sgvwUqKI+lX439ww3B3/GBcv6ws9y865J2gJD8YEY
 iuL5K3onk1iwYLVOPG8Yvx/ZxNNHTGCgQWbZbk5r/WLbw+uVYcvBLSKA95dZKDSY
 EIAFtIRrYq3zAYJqwRV7RtT4wpDwGsU3GN9TsLC+Yxb/kNFiT6KrbzNjBYgkfTas
 qTP8vRPC72ncLhjBcQYa2gJZEdKQt1KZtTrjV/nIUq4HVRUM4tkDUN/V06IOdntM
 CREh18QPiIeFm2JEQntilUigJgSXJ3FJP+AMIb8RtP5RewP7vk/7RinE=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Status: No, score=0.001 tagged_above=-10 required=5
 tests=[FREEMAIL_FROM=0.001] autolearn=disabled
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mdd1fGJKYGqn for <cocci@systeme.lip6.fr>;
 Thu,  2 May 2019 23:04:14 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id 5C53825A
 for <cocci@systeme.lip6.fr>; Thu,  2 May 2019 23:04:14 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id 1FEDE41D2
 for <cocci@systeme.lip6.fr>; Thu,  2 May 2019 23:04:14 +0200 (CEST)
To: Coccinelle <cocci@systeme.lip6.fr>
From: Michael Stefaniuc <mstefani@mykolab.com>
Openpgp: preference=signencrypt
Message-ID: <1f616769-3fb1-6d41-93eb-82aecc5cb766@mykolab.com>
Date: Thu, 2 May 2019 23:04:04 +0200
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 02 May 2019 23:04:20 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 02 May 2019 23:04:16 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Matching more than one declaration?
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hello,

it seems that more than one declaration cannot be matched in one rule:

@@
identifier i, f;
@@
- int i;
- int f;

That won't match

void foo(void)
{
    int i;
    float f;
}


Is there a way to do that?
In my specific case I need to replace 3 declarations with a single
declarer. I can use 3 separate rules but the first rule will produce
false positives if the other two declarations aren't there.


thanks
bye
      michael
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
