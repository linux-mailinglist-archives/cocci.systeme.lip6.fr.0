Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8C13BE55
	for <lists+cocci@lfdr.de>; Wed, 15 Jan 2020 12:26:36 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00FBPtPl014504;
	Wed, 15 Jan 2020 12:25:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 95B9077F7;
	Wed, 15 Jan 2020 12:25:55 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4B40B77E3
 for <cocci@systeme.lip6.fr>; Wed, 15 Jan 2020 12:25:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00FBPkMM027181
 for <cocci@systeme.lip6.fr>; Wed, 15 Jan 2020 12:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579087545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m0koiqsnj6uIPgKYNHXI2/h+i3moj0y9YLmJpDvfi78=;
 b=cm7bYK3puFjAcBdosl8bbDg0TSpeHdMbsiVhp7aKlpDEG1ghmFZxlC1gXJJOoXs4zSPdpi
 eMz+i3kzjCRrvMJJ/YzJEyOIWY4uatrN6B+7zzW36iIiwdS/1fgme0o0ypKyEpJdgn0fvp
 XMAdWz8Ft3voxmtjYOX/go3Nm1y5fXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-K6hNm5mgNs2fEZkR5jceCQ-1; Wed, 15 Jan 2020 06:25:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A4581951285;
 Wed, 15 Jan 2020 11:25:43 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
 by smtp.corp.redhat.com (Postfix) with SMTP id 24A3F10372DF;
 Wed, 15 Jan 2020 11:25:41 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Wed, 15 Jan 2020 12:25:42 +0100 (CET)
Date: Wed, 15 Jan 2020 12:25:40 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Message-ID: <20200115112540.GA18161@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: K6hNm5mgNs2fEZkR5jceCQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 15 Jan 2020 12:25:58 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 15 Jan 2020 12:25:47 +0100 (CET)
Cc: cocci@systeme.lip6.fr
Subject: [Cocci] Q: does spatch understand typeof?
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

trivial example:

	@r@
	int x;
	@@

	* x = 0;

C code:

	void f(void)
	{
		int a;
		__typeof__(a) b;

		a = 0;		// this matches
		b = 0;		// this doesn't
	}

is it correct?

Thanks,

Oleg.

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
