Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1771306F7
	for <lists+cocci@lfdr.de>; Sun,  5 Jan 2020 10:47:49 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0059lKrw012969;
	Sun, 5 Jan 2020 10:47:20 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E367E77E7;
	Sun,  5 Jan 2020 10:47:19 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CFF3973E2
 for <cocci@systeme.lip6.fr>; Sun,  5 Jan 2020 10:47:17 +0100 (CET)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0059lH9m028167
 for <cocci@systeme.lip6.fr>; Sun, 5 Jan 2020 10:47:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1578217635;
 bh=wk4FaSr9OFkclCOCgZQQ4pI//PgGvV8iy7v6L3gphMU=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=GHLAwa/hm6mN7Zp3A7wwu7Ypx1TnODbPEhGnBbK1YyyME1jqUGlSPffe9d73Sc7Jx
 uhb4w3rV5Z6cEZ3ZqSzpfmkAs2OE1/82gnn7e3Ts46DU9JgLbRtj/qP7+Zoj3TSZZI
 0Wfk/38xyScCxjvrB54G+tkfBaBxqFuILhFAfPPM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.187.152]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MBCcv-1ixdPL3ATF-00AHiN; Sun, 05
 Jan 2020 10:47:14 +0100
To: David Young <dyoung@netbsd.org>
References: <20200103160304.GG17258@pobox.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <08d3a32e-7adc-ff5b-52d0-9e67ed03ae42@web.de>
Date: Sun, 5 Jan 2020 10:47:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200103160304.GG17258@pobox.com>
Content-Language: en-US
X-Provags-ID: V03:K1:qjZ1RPrPAHWh0/XcPiQIUFZS4zFRHvhrjBdQSL9nbpa/g1l1W8f
 x/gMyQsXWehM9leKywPDABUG6ASVm8DAOF3sUM1gFI65lzVUewrVJO5xi766DLpVMMXbbdb
 +vkmYb9oys4H6oPjjc0GW7XwkzbK80rBeFHM9xK8zJFsfJGmGGLgrrqhpEgMF6aAQpt1oCX
 Mt0TFoWdmw/CUuhw78qxg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yYJKmatBAqs=:GGj/xPhzbvizj6fk74Fnj0
 L57sOHluiyZGHXIFv+QhMgPgKc3DCqCaYQYv1TObgSWCOhtQzTrwCWK+y4Ywhk0EPc+ofW8dK
 v7jkcg2Mh4r71qdRyjp+Lt5iQPOnyu3xayj3KFKhNn/0mgSmPOy5VJZpPEB4VLal281l0fox6
 /UOENaEUyMESNO24zC2Hh4fH0NUeNshoiehiPuBtEYZ0R8W7eIuh5n8vClJrnVvQGVC3u2cUO
 jPfEUAMfY0F+83MKD57e/37UgF0F7JXKsCYS3nw0dfOM6RgQpF5+BH3T/DVrpPHU96Eqh6VfY
 4sk5PxHlr1NMPdJ8OjuZRDus7GlcTbccZ7GXAYk6T50h/QRvZnVTSBwhokLFG2SfzZwqLna5j
 TRbweTVq7rSCk11TZdKWY4Qh5kJgoO1pekB9sDu2Sv551CN8AqL8Yc2CUN9meS5V1KDfA35Mr
 BrNgt9iQ9P/vVyIpt97dARVTTM8d1+4aMPoRi9T1htlBrDw9r4/i620+tWAKI7V2AKzxfDQeN
 Hg0hm18D7VdGrEGb1MhuN3nK/OD0ZaQDjW8zYGssMbMd3S8zLBiziR4ZlbCyrkQOJQ3b8Zbwj
 LLb3f4h9TCpDMWRon1P14I4E0p7AX42QujjPfh6M0Cs4Vn2cMPFQS/zGQPrycsh65zv+KQD4u
 VOhf1+ImaN5BuwvhVn/8JSOJe/QK0hxJ821Emj5QhuLXDz7XMgqzqCnJFYX0EzWGcXxoLypWS
 bIg9tHEdvIY+bq0kd5+s4YA/7bli9TjJk7KVbGQcl5utUO/eie+gg2INKIbil9y3eoBOrYZdA
 Qy5nAXFKIJg4zS/R8ude2Gwux+4nax6L+F9A/PeANE3a4ng0U9pACjEnQbYxWJOvLXjv3ltur
 Gx+EZhpgedqmKVmPpHtV/eizwMZpla+zYNADGayhsN4vXn38FPnvalLm8K7996AB0G30zf5Uf
 I2gKos34f4BDFOQl9WEHzSQQCtcuxGdETeGbEHLkNjJ2npyd/HdgBtBi7MSw6jtKmsn9AdqPu
 H+OZ/X5XFbm0OeltMDrIXmCQp2n2z7PpWeEv6puuZK8Rp242HOUXBg60up6qiVDGIF/8tZBcO
 QDDCiuvb+gpGBk0d+4yjhIETsNbSX8FsCmmWVtuLXUGz9yhsZkgSrYjacfMchgxbB/ZNm9gL6
 lamYZ4BcQqQmv2WRlmIh8VoYAyq3pBP2MzkksK+evF7fIJ7Cp6OJiQEzOKcKYYg0KRipvw/+A
 PBFnWqbiY9Gi8ER3U7Lb2TAaboF0fhWzPhmJujBOZIIUyglqqjbBs92HaO9A=
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 05 Jan 2020 10:47:21 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 05 Jan 2020 10:47:17 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] transforming arguments to statement macros?
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

> I would prefer that the macros were written with the do-while pattern,
> but it's a legacy codebase that uses HGOTO_ERROR() no fewer than 12,000
> times, and most occurrences have no semicolon.  I will have to automate
> the conversion, and I guess that I cannot use spatch to do it.

Would you like to try out how good semicolons can be added behind
these macro calls by a small script for the semantic patch language?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
