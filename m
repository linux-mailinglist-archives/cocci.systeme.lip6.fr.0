Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE22B2C8
	for <lists+cocci@lfdr.de>; Mon, 27 May 2019 13:10:50 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4RBA9vG024796;
	Mon, 27 May 2019 13:10:09 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BF0267762;
	Mon, 27 May 2019 13:10:08 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A125A7747
 for <cocci@systeme.lip6.fr>; Mon, 27 May 2019 13:10:06 +0200 (CEST)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4RBA6e1025497
 for <cocci@systeme.lip6.fr>; Mon, 27 May 2019 13:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1558955406;
 bh=Ty46plRGjVLBY9QzSTk0jte8qWqmJpiq9FaMZ3Go8nc=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=hL8PPn6bI6mzkCIfrFE9aCXh1xcjzUUCV3OYnS4AeSluZNSx2+/oFgSDjrOuqPgcO
 RfQDPyRZn0I6L44Vnt1gIGlXiAOlnzJ8bwHXqt1cedFFAhkOlPpBhZEmcXCBnlSkJP
 UajeGnR5irUw2f2cqMf3r/dJw1vzMPzTTYyBZlIQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.4] ([2.243.140.65]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LqDHE-1h0IY93Zjs-00dmwV for
 <cocci@systeme.lip6.fr>; Mon, 27 May 2019 13:10:05 +0200
To: Coccinelle <cocci@systeme.lip6.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <7be9b8ed-cb53-bd25-cbcf-638abe5de086@web.de>
Date: Mon, 27 May 2019 13:10:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:sCuTEa4Ypdk0CEFxg1hNnVI4XGJaiRgAYoPej/tir1OtY7FEx5P
 zMPn4hmIfW9LEZUKDBRSTe2oakB9774UWJA2Fh83Ks6PeMzyz8QmhHZBcyoQupK9emyr9py
 bSOdx8j7V4P7qup/X6cVUNGa6x2W5/4rY34iv8032iGt4orX2D911WGGXUUEaqYzvJB11J9
 5C6uR/RRriro+YU8xNONg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ldnmDGQN8AA=:z0wBo8IkmK5fyJ8vOHSzkc
 axY+B6xIYgX9DSQ7Z+onVdFzA1KhtMZKZV78mjQQlIiBAMe6C79ERen9g8EGfLbiQDswZxZky
 qIP4D4r01/L4S0EFVaTfhHAHj+pRgNPI9lIVqZMeoSMVzPTjpVa13/V2174ks9zg+iFLQtMuF
 /am/QMhaVsnZepnrxdZfYxOfVO4ZWNUvA/mr7f7FJ0EQr0LFWep8ev7kBqKrstPnIJozKkuEc
 lDj+b5U3olUQbPc4WwDs9CeK16jDdeSR7/9jaDMK4MiMmRWKDerLCtCzQPyepdkfe1M5KeRgY
 wfGHY4QNV2AosxnoFhbXQ//PP61fwvYf6ytUVYUoIMoe2+tMIQBoNPPozwwYM9MxmK6ucxh65
 wYu2uldZpUqTJ7yVAGmxununvAPHzFWQJaqLUzJez1bgjy9+EkuFV7Lz7v5xtPXIgc2c095il
 6IPYpquJThOQ77Ts51WURszQI7BbEr03O5W1l9KEps47Y5GP25wNIPrRIlvryJTUfG7l4MnPz
 8NvQEwZVp2TslgZ+Y86i7P//sfkCoax00lkkkU5h+Q8zhYHrTftMYYb0RUofzzo+dMUPqXcej
 E/vm/QMu/C3a/dxuXSfHZpX3+TvBuy0cFWuJcwXe9Ce7YvsmbAgE3NazyaIzqc+1DULUeaclR
 L/jyM6SMUuzhUOxzQ/WDwWHLc+nUUYPksIqHwMzQusOAHPxMpiPj1C2fzpjMUGaFFNonPjHnm
 EjGbzeYFHm1sSWW5j12b9mmktnLD6Qj2eEWC1zt2YLPynLoZwU+0tXRBJhb6JojJ1mCFLGzbR
 vMTfBk6yriW9S5YhfO+oexRy7Pkj233WPM8C36N2wxpbeEQzAkSlwe8nAFSjU7Fu+XlMfdTck
 E4UvroSKJzUW770nR/JxkmE3tnhiLwbqNQDKnUI0ZVcsYC2KkP0ZzTz4bYTfH1PM0J2Q86Fv4
 h58iPHZHo/NdZ8UX0ybrKwAxL0HTq15aYjvKF1qPOe0Or+XFDq3BR
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 May 2019 13:10:11 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 27 May 2019 13:10:06 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] Checking structures for usage of OCaml variables with
 inherited SmPL data
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

The semantic patch language supports also the specification and handling
of OCaml script rules. Inherited SmPL variables can be connected to
corresponding local variable names.

I would appreciate if the determination of the provided data structures
can become easier.
* Which data types can become relevant for further data processing?
* Which fields should be picked up for data output?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
