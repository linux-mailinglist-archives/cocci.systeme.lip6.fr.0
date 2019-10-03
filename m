Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0189C9807
	for <lists+cocci@lfdr.de>; Thu,  3 Oct 2019 07:48:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x935jpuM007584;
	Thu, 3 Oct 2019 07:45:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E46BC77BD;
	Thu,  3 Oct 2019 07:45:50 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3239044D7
 for <cocci@systeme.lip6.fr>; Thu,  3 Oct 2019 07:45:49 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x935jmwA028798
 for <cocci@systeme.lip6.fr>; Thu, 3 Oct 2019 07:45:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,251,1566856800"; d="scan'208";a="321445179"
Received: from 81-65-53-202.rev.numericable.fr (HELO hadrien) ([81.65.53.202])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 07:45:48 +0200
Date: Thu, 3 Oct 2019 07:45:48 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Michael Stefaniuc <mstefani@mykolab.com>
In-Reply-To: <c0801ee0-c227-5d9d-50ff-3ad872621808@mykolab.com>
Message-ID: <alpine.DEB.2.21.1910030745320.2638@hadrien>
References: <c0801ee0-c227-5d9d-50ff-3ad872621808@mykolab.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 03 Oct 2019 07:45:52 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 03 Oct 2019 07:45:48 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Missing support in SmPL for wide char character
 constants and string literals
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



On Wed, 2 Oct 2019, Michael Stefaniuc wrote:

> Hello!
>
> SmPL doesn't support the character constants of the form:
> u'c', U'c', L'c'
>
> nor the string literals of the form:
> u8"", u"", U"", L""

What is the type of these things?

julia

>
> A test case is attached as a patch for the coccinelle tests.
>
> minus: parse error:
>   File "tests/wchar.cocci", line 8, column 22, charpos = 106
>   around = ''',
>   whole content = - char16_t zero = u'\0';
>
>
> thanks
> bye
> 	michael
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
