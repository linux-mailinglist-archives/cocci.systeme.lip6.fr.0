Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36921FFF4E
	for <lists+cocci@lfdr.de>; Mon, 18 Nov 2019 08:08:50 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAI78LKW002695;
	Mon, 18 Nov 2019 08:08:21 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4AFEA77D9;
	Mon, 18 Nov 2019 08:08:21 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B618277C6
 for <cocci@systeme.lip6.fr>; Mon, 18 Nov 2019 08:08:19 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAI78Jfm022007
 for <cocci@systeme.lip6.fr>; Mon, 18 Nov 2019 08:08:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1574060899;
 bh=mn6/ezlSn0nyeE5eEb5iAa3jyYw1hdIA5yaS+lhALm4=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=GBKnhje7VSWy6QOtMRvgUv0iVwMRYFc2evV3svjueRfb+TopfPGZlwxEfL0EU1etG
 ukCCv19nx55fORrbnrWb+xaogJ6piumJGBFW7ab2ebhi3mcFcj+6xIeR1Af6/juyIV
 d3B+RfNTqnsCnvXyLaIu/Qa150BSbaNGjN9XC8wc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.191.247]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfRzh-1i4TKF3dwf-00p2jy for
 <cocci@systeme.lip6.fr>; Mon, 18 Nov 2019 08:08:18 +0100
To: Coccinelle <cocci@systeme.lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <2fd7c36b-552c-8dea-a39d-ab484fb45995@web.de>
Date: Mon, 18 Nov 2019 08:08:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:dp3UqxI9TvxFY+2nz6V2NhB2tb8ppQMo/FeRHrv3qzY0h/yj87T
 M4HSX/kulG6VoEvQ71k6G/nbuNZcfFGTizkQxXYoUnq/imOBLTtWdDx6GKyb0UojEey7bru
 IpDE94zxsjGU0roY+0qBCzIGo9wpnjsLEybABQq+p5Fx+AM04xu7WjOnofkBSPKsaMg1gWc
 0/EzjzKSwjSZQv4gQCq+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ul//K2L2NqQ=:FyZIfqn27YcxRLAO+M4DBA
 tvNTVtGobQkKqh9sT+V+W1YFa6xe6T7bdhPLSq2CyUtvv3s7vln0BkxK4ZK5bdtaXBAuslwlt
 23QP+J6FTB5BWyzNxZI5h0vrGNct7oXUWZp4/9xMwPthZdC2jnvv8dbZyx6Ml7x4Bihi3IH1F
 p6Cp90XLyHnuCKFR6koTFQhzzNZFdephXwgzU8+pslKbkS1u004UmWWYWojEHnzf0rs422QOw
 FEia/oLAWbT2+vD1DYOknHcXSLV2Vqhtmha+LHmNekNvFMc8o6hBn1NrcdiAXFegzPpU/SCFo
 trx9NSk/r5v2BZhfrBO1hXHNKzGgnST+WJNCdhNcltltRVST3Lza7c4pFLdz+4wBdSWEhnX1s
 kth0sta6I3O61+i/nlYK6DxNMrljtUmVevgEQ/h0vICvauhDbmGtDjHT76zToHfkOC2z99jyY
 OYPkbr3cZZqKYodtUdPSUaUjCEKXpC/YYBd9cokEouX8KEo6x6ATaixvSu8HVQx2tMmkO/ELC
 +xpkNlzPeu0eeEdb+9vwgJjUquAVgdpm7RjYi7e2UsH4Vjq6gsfH1O6EXuY8vPeVPQIRMPBr0
 vSqD5JjDbHuGmle5lzte1b9oix/bNOD/5uAJxcadHYUhOdYX//1mOf6P5+EgmYxZ3vz1CrW6t
 yMKg2Agj1h+JV6IiWQfMcuACJe/RN2v1NtbAAUI5hV37vEivD2V8nXIKTJNz/Ul/EszztZN8F
 vbwYyJid/1GQHYqa5PDt6Jg8FRJN8Wg+ucI4HfZy3C8pmOywDbPmK6NTkFFpxWXP9k/TKdFk8
 5qA7BW0tuMAvPT1k+t9dmYHrprQGPdKYbDINcMtYhWc2tU03+aPkOTZ2h2NjtfIKnBEOlKusy
 TsUKnr1+nkDsD96VboBEJuHpmN+BoKZHNrpnUfz6DlK2P3A6uhaqycEgKh5AOcU/ruS0UmxxW
 BzoecPwQfIk0prG7QTse5ZclRs0GZ3+nS6LRgySGCeAJlGGcapZ7Lp8zTdnvaUs+3IF7c9zdW
 e8/cmyLJJjz9eOCIcDQbN7Vl7ckDp+AtZMV9sEA5OklE98UVbhAWhRzfO2Hj9yUViqcX25JqY
 QiXTJjHYsNaE9dWIETL4EWVhZPFklw/6GSKbUMZSmKT05LKzZsJYuXp4GkIZdiU1PhrX3peJ6
 LfXUT76lIoTau9Ynr3ndHeAcQ2RpD4UtgWYJ8wDtQ3rOXSzLnTxCfEOWQZTqzxcaWp46mRAUC
 UNtM/fs5Y3zm1/Wr31xE5tZ+WUpT2/c3iZt408bZbHTOp/U4KBB7uizAGUOQ=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 18 Nov 2019 08:08:23 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 18 Nov 2019 08:08:19 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Relationships between kinds of metavariables?
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

The semantic patch language supports metavariables.
Now I would like to know a bit more about possible relationships between them.

Examples:
* type
* expression


Is any kind of metavariable available which would be a superset
according to another item?

Can the specification of SmPL disjunctions be accordingly improved then?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
