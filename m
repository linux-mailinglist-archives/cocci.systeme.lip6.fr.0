Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBA61B0FE0
	for <lists+cocci@lfdr.de>; Mon, 20 Apr 2020 17:22:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03KFLawH001964;
	Mon, 20 Apr 2020 17:21:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B176B7830;
	Mon, 20 Apr 2020 17:21:35 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 766967459
 for <cocci@systeme.lip6.fr>; Mon, 20 Apr 2020 15:54:53 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03KDsm3g029864
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA256 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Mon, 20 Apr 2020 15:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587390888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFULnFKsBDlng0vLGfYVe8geL2ZV2oJgwic6vEtr4HE=;
 b=Rn1YTgNIVeUiSfA8wYz/1dHk+hnHKwPBlsj+bLNMqVFCqbsMFDroCi3Pdh+jPUlJwln44R
 tSul6/lZoexoTjv8XReyXsXtpLQTUnj58iZ0yDpTbn0uyrSUWC6I/+WI4vPKN3Q9siYW4w
 ZPYvOWyQYHxREPVQUjGT+7gOa+f1UGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-91JkwAvuMIGqZjuxpkT8hA-1; Mon, 20 Apr 2020 09:54:46 -0400
X-MC-Unique: 91JkwAvuMIGqZjuxpkT8hA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D240018C35A2;
 Mon, 20 Apr 2020 13:54:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A404CCFDEE;
 Mon, 20 Apr 2020 13:54:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F277A11358BC; Mon, 20 Apr 2020 15:54:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>
References: <eeb90865-05a7-cdf3-fd27-cf190c2d53ca@web.de>
Date: Mon, 20 Apr 2020 15:54:42 +0200
In-Reply-To: <eeb90865-05a7-cdf3-fd27-cf190c2d53ca@web.de> (Markus Elfring's
 message of "Mon, 6 Apr 2020 10:20:19 +0200")
Message-ID: <87imhugt3x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 20 Apr 2020 17:21:36 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 20 Apr 2020 15:54:50 +0200 (CEST)
X-Mailman-Approved-At: Mon, 20 Apr 2020 17:21:32 +0200
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Function-like macro with the same name as a typedef
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

Markus Elfring <Markus.Elfring@web.de> writes:

>> * spatch seems to have trouble parsing
>>
>>     ARMSSE *s = ARMSSE(opaque);
>>
>>   where ARMSSE is a typedef, and ARMSSE() is a function-like macro.
>>   Yes, I know that's in rather poor taste.
>
> I am curious for the safe handling of related software development challenges.
>
>
>> * Workaround #1: rename the typedef to ARMSSE_
>
> Will adjustments become more interesting also around such name space issues?

I'm not sure I understand your question.  Can you elaborate?

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
